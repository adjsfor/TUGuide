//
//  TUGuideAppDelegate.m
//  TUGuide
//
//  Created by Adrian Djokic on 11/3/10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "TUGuideAppDelegate.h"

@implementation TUGuideAppDelegate

@synthesize window;
@synthesize mainNavigationController;
@synthesize me;
@synthesize serverLogin;
@synthesize serverCreate;
@synthesize tabBarController;
@synthesize getData;
@synthesize organizerViewController,mapViewController,friendViewController,mensaViewController,missViewController;
@synthesize buildingsArray, classroomsArray, restaurantsArray, mensasArray;
@synthesize email, password;

#define BUILDINGS   0
#define MENSA		1
#define RESTAURANT  2
#define CLASSROOM   3


#pragma mark -
#pragma mark Application lifecycle


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"APPDELEGATE: about to switch to view");
	
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"APPDELEGATE: switched views: message from the nav controller delegate");
}



-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	XLog();
	
	//login successful -> switch to tabbar 
	if ([cmd isEqual:@"loginSuccessful"]) {
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		me = serverLogin.me;
		
		[self initTabBar];
		return YES; 
	}
	
	if ([cmd isEqual:@"registerSuccessful"]) {
		// only when im logged in, kill whole MainNavigationController baum, open new TabBarNavigationController
		[mainNavigationController.registerViewController.registerView.usernameField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField2 resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.emailField resignFirstResponder];
		
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Info" message: @"Successfully registered" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
		[mainNavigationController switchToController:@"Login" animated:YES];
	}
	
	if ([cmd isEqual:@"goRegister"]) {
		// startRegisterEvent in ServerLogin, with data from fields
		// self.mainNavigationController.registerViewController.registerView.passwordField.text; etc etc
		[mainNavigationController.registerViewController.registerView.usernameField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField2 resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.emailField resignFirstResponder];
		
		[serverCreate createUserWithScreen_name:[mainNavigationController.registerViewController.registerView.usernameField text] withPassword:[mainNavigationController.registerViewController.registerView.passwordField text] withMail:[mainNavigationController.registerViewController.registerView.emailField text]];
	}
	
	// startLoginEvent in ServerLogin with email und password
	if ([cmd isEqual:@"goLogin"]) {
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		
		[serverLogin loginUserWithScreen_name:[mainNavigationController.loginViewController.loginView.emailField text] withPassword:[mainNavigationController.loginViewController.loginView.passwordField text]];
	}
	
	if ([cmd isEqual:@"loginFromPreferences"]) {
		[serverLogin loginUserWithScreen_name:email withPassword:password];
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
		// startLoginEvent in ServerLogin with params
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Invalid password/username combination, please try again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[self initLogin];
		[someError show];
		[someError release];
	}
	
	
	// failed to register
	if ([cmd isEqual:@"registerFail"]) {
		[mainNavigationController.registerViewController.registerView.usernameField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField2 resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.emailField resignFirstResponder];
		
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Invalid password/username combination, please try again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	
	
	// server offline
	if ([cmd isEqual:@"serverOffline"]) {
		[mainNavigationController.registerViewController.registerView.usernameField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.passwordField2 resignFirstResponder];
		[mainNavigationController.registerViewController.registerView.emailField resignFirstResponder];
		
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message: @"We are sorry but our server is offline, please try again later!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	return YES;
}

-(void)passingCommand:(NSString *)cmd sender:(int)sd message:(NSString *)msg data:(NSString *)data{
	
	if ([cmd isEqual:@"dataRecievedFailed"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
		//exit(0);
	}
	if ([cmd isEqual:@"serverOffline"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		//exit(0);
	}
	if ([cmd isEqual:@"allDataRecieved"]) {
		buildingsArray = [getData getAllBuildingsAsArray];
		classroomsArray = [getData getAllClassroomsAsArray];
		restaurantsArray = [getData getAllRestaurantsAsArray];
		mensasArray = [getData getAllMensasAsArray];
		
		[self passing:self command:@"loginFromPreferences" message:@"try to login from Preferences"];
	}
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if (!window) 
    {
        [self release];
        return NO;
    }
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"name_preference"]!=nil) {
		email = [[NSString alloc] initWithString:[[NSUserDefaults standardUserDefaults] stringForKey:@"name_preference"]];
	}else {
		email = [[NSString alloc] initWithString:@""];
	}
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"password_preference"]!=nil) {
		password = [[NSString alloc] initWithString:[[NSUserDefaults standardUserDefaults] stringForKey:@"password_preference"]];
	}else {
		password = [[NSString alloc] initWithString:@""];
	}
	
	serverLogin = [[ServerLogin alloc] init];
	serverLogin.delegate2 = self;
	
	mainNavigationController = [[MainNavigationController alloc]init];
	mainNavigationController.delegate = self;
	mainNavigationController.delegate2 = self;
	//[window addSubview:mainNavigationController.view];
	serverCreate = [[ServerCreateUser alloc] init];
	serverCreate.delegate2 = self;
	
	getData = [[ServerGetData alloc] initAll];
	getData.delegate2 = self;
	
	UIActivityIndicatorView *activityIndicatorView =
	[[[UIActivityIndicatorView alloc]
	  initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray]
	 autorelease];
	
	activityIndicatorView.autoresizingMask =
	UIViewAutoresizingFlexibleLeftMargin |
	UIViewAutoresizingFlexibleRightMargin |
	UIViewAutoresizingFlexibleTopMargin |
	UIViewAutoresizingFlexibleBottomMargin;
	[activityIndicatorView startAnimating];
	
	activityIndicatorView.frame = CGRectMake(135.0, 400.0, 35.0, 35.0);
	
	UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(135.0, 400.0, 200.0, 50.0)];
	[text setText:@"Loading data form server...."];
	
	
	UIView *start = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"startUp.png"]];
	[start addSubview:img];
	[start addSubview:activityIndicatorView];
	[window addSubview:start];
	[window makeKeyAndVisible];
	[start release];
	[text release];
	[img release];
	
	// need to go away , only testing 
	//[self initTabBar];
	
	
	
	
	return YES;
}

-(void)initTabBar
{
	NSLog(@"Creating Tabbar");
	//initialize the ViewControllers for the tabBarController
	organizerViewController = [[OrganizerViewController alloc] initWithClassrooms:classroomsArray];
	mapViewController = [[MapViewController alloc] initWithBuildings:buildingsArray];
	friendViewController  = [[FriendsViewController alloc] initView];
	mensaViewController = [[MensaViewController alloc] initWithMensas:mensasArray andRestaurants:restaurantsArray];
	missViewController = [[IMissedViewController alloc] init];
	
	//Creating the tabbarControllers
	UINavigationController *org = [[UINavigationController alloc] initWithRootViewController:organizerViewController];
	UINavigationController *loc = [[UINavigationController alloc] initWithRootViewController:mapViewController];
	UINavigationController *fri = [[UINavigationController alloc] initWithRootViewController:friendViewController];
	UINavigationController *foo = [[UINavigationController alloc] initWithRootViewController:mensaViewController];
	UINavigationController *mis = [[UINavigationController alloc] initWithRootViewController:missViewController];
	
	NSMutableArray *controllers = [NSMutableArray array];
	
	[controllers addObject:org];
	[controllers addObject:loc];
	[controllers addObject:fri];
	[controllers addObject:foo];
	[controllers addObject:mis];
	
	tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = controllers;
	[window addSubview:tabBarController.view];
	
	
	[org release];
	[loc release];
	[fri release];
	[foo release];
	[mis release];

	
	
	
	
}

-(void)initLogin
{
	//creating the loginView
	NSLog(@"Creationg login");
	mainNavigationController = [[MainNavigationController alloc]init];
	mainNavigationController.delegate = self;
	mainNavigationController.delegate2 = self;
	[window addSubview:mainNavigationController.view];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[mainNavigationController release];

	[window release];
    [super dealloc];
}


@end
