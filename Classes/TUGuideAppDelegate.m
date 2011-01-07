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


#pragma mark -
#pragma mark Application lifecycle


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"APPDELEGATE: about to switch to view");
	
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"APPDELEGATE: switched views: message from the nav controller delegate");
}



-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	//login successful -> switch to tabbar 
	if ([cmd isEqual:@"loginSuccessful"]) {
		
	}
	
	if ([cmd isEqual:@"registerSuccessful"]) {
		// only when im logged in, kill whole MainNavigationController baum, open new TabBarNavigationController
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Info" message: @"Successfully registered" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
		[mainNavigationController switchToController:@"Login" animated:YES];
	}
	
	if ([cmd isEqual:@"goRegister"]) {
		// startRegisterEvent in ServerLogin, with data from fields
		// self.mainNavigationController.registerViewController.registerView.passwordField.text; etc etc
		[serverCreate createUserWithScreen_name:[mainNavigationController.registerViewController.registerView.usernameField text] withPassword:[mainNavigationController.registerViewController.registerView.passwordField text] withMail:[mainNavigationController.registerViewController.registerView.emailField text]];
	}
	
	// startLoginEvent in ServerLogin with email und password
	if ([cmd isEqual:@"goLogin"]) {
		[serverLogin loginUserWithScreen_name:[mainNavigationController.loginViewController.loginView.emailField text] withPassword:[mainNavigationController.loginViewController.loginView.passwordField text]];
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
		// startLoginEvent in ServerLogin with params
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Invalid password/username combination, please try again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	
	
	// failed to register
	if ([cmd isEqual:@"registerFail"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Invalid password/username combination, please try again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	
	
	// server offline
	if ([cmd isEqual:@"serverOffline"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message: @"We are sorry but our server is offline, please try again later!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	
	//NSLog(@"%@", requestor);
}





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if (!window) 
    {
        [self release];
        return NO;
    }
	
	//TODO: check for pre defined settings if good then log in

	serverLogin = [[ServerLogin alloc] init];
	serverLogin.delegate2 = self;
	
	serverCreate = [[ServerCreateUser alloc] init];
	serverCreate.delegate2 = self;
	
	mainNavigationController = [[MainNavigationController alloc]init];
	mainNavigationController.delegate = self;
	mainNavigationController.delegate2 = self;
	//[window addSubview:mainNavigationController.view];
	
	//OrganizerViewController *org = [[OrganizerViewController alloc] init];
	LecturesViewController *le = [[LecturesViewController alloc]init];
	
	
	UINavigationController *org = [[UINavigationController alloc] initWithRootViewController:[[OrganizerViewController alloc] init]];
	UINavigationController *loc = [[UINavigationController alloc] initWithRootViewController:[[LocationViewController alloc] init]];
	
	
	NSMutableArray *controllers = [NSMutableArray array];
	//[controllers addObject:mainNavigationController];
	[controllers addObject:org];
	[controllers addObject:loc];
	
	
	tabBarController = [[MainUITabBarController alloc] init];
	
	
	tabBarController.viewControllers = controllers;
	
	//tabBarController.customizableViewControllers = controllers;
	
	
	[window addSubview:tabBarController.view];
	
	//MapViewController *map = [[MapViewController alloc] init];
	//[window addSubview:map.view];
	
    
    [window makeKeyAndVisible];
    
    return YES;
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
