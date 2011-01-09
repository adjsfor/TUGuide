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



-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	XLog();
	
	//login successful -> switch to tabbar 
	if ([cmd isEqual:@"loginSuccessful"]) {
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		
		window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
		[window addSubview:tabBarController.view];
		[window makeKeyAndVisible];
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
		[getData getAllRestaurants];
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
		// startLoginEvent in ServerLogin with params
		[mainNavigationController.loginViewController.loginView.emailField resignFirstResponder];
		[mainNavigationController.loginViewController.loginView.passwordField resignFirstResponder];
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Invalid password/username combination, please try again!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
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
	
	
	//NSLog(@"%@", requestor);
}

-(void)passingCommand:(NSString *)cmd sender:(int)sd message:(NSString *)msg data:(NSString *)data{
	
	if ([cmd isEqual:@"dataRecieved"]) {
		//NEEDET VARIABLES
		NSData *plistData = [data dataUsingEncoding:NSUTF8StringEncoding];
		NSString *error;
		NSPropertyListFormat format;
		NSMutableArray* array;
		NSMutableDictionary* myDict;
		Classroom *c;
		Building *b;
		Mensa *m;
		//END
		switch (sd) {
			case BUILDINGS:
				
				array = [NSPropertyListSerialization propertyListFromData:plistData
																		 mutabilityOption:NSPropertyListImmutable
																				   format:&format
																		 errorDescription:&error];
				if (array) {
					myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
					NSLog(@"The count: %i", [myDict count]);
					for (NSDictionary* dict in array) {
						b = [Building customClassWithProperties:dict];
						NSLog(@"----------------------------");
						NSLog(@"Building id: %@",b.id);
						NSLog(@"The name: %@", b.name);
						if (b.classroomsList != nil) {
							for (Classroom* class in b.classroomsList){
								NSLog(@"Classroom name: %@", class.name);
							}
						}
						NSLog(@"----------------------------");
						//[b release];
					}
				} else {
					NSLog(@"Plist does not exist, error:%@",error);
				}
				break;
			case RESTAURANT:
				
				break;
			case MENSA:
				array = [NSPropertyListSerialization propertyListFromData:plistData
														 mutabilityOption:NSPropertyListImmutable
																   format:&format
														 errorDescription:&error];
				if (array) {
					myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
					NSLog(@"The count: %i", [myDict count]);
					for (NSDictionary* dict in array) {
						m = [Mensa customClassWithProperties:dict];
						NSLog(@"----------------------------");
						NSLog(@"Mensa id: %@",m.id);
						NSLog(@"The name: %@", m.name);
						NSLog(@"The adress: %@", m.address);
						if (m.mensaMenus != nil) {
							for (MensaMenu* menu in m.mensaMenus){
								NSLog(@"menu name: %@", menu.name);
							}
						}
						NSLog(@"----------------------------");
						//[m dealloc];
					}
				} else {
					NSLog(@"Plist does not exist, error:%@",error);
				}
				break;
			case CLASSROOM:
				array = [NSPropertyListSerialization propertyListFromData:plistData
														 mutabilityOption:NSPropertyListImmutable
																   format:&format
														 errorDescription:&error];
				if (array) {
					myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
					NSLog(@"The count: %i", [myDict count]);
					for (NSDictionary* dict in array) {
						c = [Classroom customClassWithProperties:dict];
						NSLog(@"----------------------------");
						NSLog(@"Classroom id: %@",c.id);
						NSLog(@"The name: %@", c.name);
						NSLog(@"The building_ID: %@", c.building_id);
						//NSLog(@"The building: %@", c.building.name);
						NSLog(@"----------------------------");
						//[c dealloc];
					}
				} else {
					NSLog(@"Plist does not exist, error:%@",error);
				}
				break;
			default:
				break;
		}
		//[myDict release];
		//[plistData release];
		//[error release];
		//[array release];
	}
	if ([cmd isEqual:@"dataRecievedFailed"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	if ([cmd isEqual:@"serverOffline"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
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
	
	//TODO: check for pre defined settings if good then log in

	serverLogin = [[ServerLogin alloc] init];
	serverLogin.delegate2 = self;
	
	getData = [[ServerGetData alloc] initWithURL];
	getData.delegate2 = self;
	
	serverCreate = [[ServerCreateUser alloc] init];
	serverCreate.delegate2 = self;
	
	mainNavigationController = [[MainNavigationController alloc]init];
	mainNavigationController.delegate = self;
	mainNavigationController.delegate2 = self;
	[window addSubview:mainNavigationController.view];
	
	
	organizerViewController = [[OrganizerViewController alloc] init];
	mapViewController = [[MapViewController alloc] init];
	friendViewController  = [[FriendsViewController alloc] init];
	mensaViewController = [[MensaViewController alloc] init];
	missViewController = [[IMissedItViewController alloc] init];
	
	organizerViewController.delegate2 = self;
	//mapViewController.delegate2 = self;
	friendViewController.delegate2 = self;
	//foodViewController.delegate2 = self;
	missViewController.delegate2 = self;
	
	UINavigationController *org = [[UINavigationController alloc] initWithRootViewController:organizerViewController];
	UINavigationController *loc = [[UINavigationController alloc] initWithRootViewController:mapViewController];
	UINavigationController *fri = [[UINavigationController alloc] initWithRootViewController:friendViewController];
	UINavigationController *foo = [[UINavigationController alloc] initWithRootViewController:mensaViewController];
	UINavigationController *mis = [[UINavigationController alloc] initWithRootViewController:missViewController];
	
	
	
	NSMutableArray *controllers = [NSMutableArray array];
	//[controllers addObject:mainNavigationController];
	[controllers addObject:org];
	[controllers addObject:loc];
	[controllers addObject:fri];
	[controllers addObject:foo];
	[controllers addObject:mis];
	
	tabBarController = [[MainUITabBarController alloc] init];
	tabBarController.viewControllers = controllers;	
	
	//[window addSubview:tabBarController.view]; // add tabbar and go
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
