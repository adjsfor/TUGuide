//
//  TUGuideAppDelegate.h
//  TUGuide
//
//  Created by Adrian Djokic on 11/3/10.
//  Copyright 2010 TU WIEN. All rights reserved.
// Das ist testing von SCM ivo
// bla bla balb la

#import <UIKit/UIKit.h>
#import "MainNavigationController.h"
#import "MessagePassProtocol.h"
#import "OrganizerViewController.h"
#import "MapViewController.h"
#import	"ServerLogin.h"
#import "ServerCreateUser.h"
#import "MainUITabBarController.h"
#import "FriendsViewController.h"
#import "FoodViewController.h"
#import "IMissedItViewController.h"

@interface TUGuideAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate,MessagePassProtocol> {
    UIWindow *window;
	MainNavigationController *mainNavigationController;
	User *me;
	ServerLogin *serverLogin;
	ServerCreateUser *serverCreate;
	
	//tabbar things
	MainUITabBarController *tabBarController;
	OrganizerViewController *organizerViewController;
	MapViewController *mapViewController;
	FriendsViewController *friendViewController ;
	FoodViewController *foodViewController;
	IMissedItViewController *missViewController;
	
	
	
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainNavigationController *mainNavigationController;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) ServerLogin *serverLogin;
@property (nonatomic, retain) ServerCreateUser *serverCreate;
@property (nonatomic, retain) MainUITabBarController *tabBarController;


@property (nonatomic, retain) OrganizerViewController *organizerViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) FriendsViewController *friendViewController ;
@property (nonatomic, retain) FoodViewController *foodViewController;
@property (nonatomic, retain) IMissedItViewController *missViewController;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end

