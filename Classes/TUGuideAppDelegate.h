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
#import "ServerGetData.h"
#import "DataPassProtocol.h"
#import "FriendsViewController.h"
#import "MensaViewController.h"
#import "IMissedItViewController.h"

@interface TUGuideAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate,MessagePassProtocol,DataPassProtocol> {
    UIWindow *window;
	MainNavigationController *mainNavigationController;
	User *me;
	ServerLogin *serverLogin;
	ServerCreateUser *serverCreate;
	
	//tabbar things
	UITabBarController *tabBarController;
	ServerGetData *getData;
	
	//ViewController for initializing the TabBar
	OrganizerViewController *organizerViewController;
	MapViewController *mapViewController;
	FriendsViewController *friendViewController ;
	MensaViewController *mensaViewController;
	IMissedItViewController *missViewController;
	
	//arrays for received data
	NSMutableArray *buildingsArray;
	NSMutableArray *classroomsArray;
	NSMutableArray *restaurantsArray;
	NSMutableArray *mensasArray;
	
	NSString *email;
	NSString *password;
	
	
	
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainNavigationController *mainNavigationController;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) ServerLogin *serverLogin;
@property (nonatomic, retain) ServerCreateUser *serverCreate;
@property (nonatomic, retain) UITabBarController *tabBarController;
@property (nonatomic, retain) ServerGetData *getData;


@property (nonatomic, retain) OrganizerViewController *organizerViewController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) FriendsViewController *friendViewController ;
@property (nonatomic, retain) MensaViewController *mensaViewController;
@property (nonatomic, retain) IMissedItViewController *missViewController;

@property (nonatomic, retain) NSMutableArray *buildingsArray;
@property (nonatomic, retain) NSMutableArray *classroomsArray;
@property (nonatomic, retain) NSMutableArray *restaurantsArray;
@property (nonatomic, retain) NSMutableArray *mensasArray;

@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *password;


-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
-(void)initTabBar;
-(void)initLogin;
@end

