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
#import "LocationViewController.h"
#import	"ServerLogin.h"
#import "ServerCreateUser.h"
#import "MainUITabBarController.h"
#import "ServerGetData.h"
#import "DataPassProtocol.h"

//TEST
#import "Building.h"
#import "Classroom.h"

@interface TUGuideAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate,MessagePassProtocol,DataPassProtocol> {
    UIWindow *window;
	MainNavigationController *mainNavigationController;
	User *me;
	ServerLogin *serverLogin;
	ServerCreateUser *serverCreate;
	MainUITabBarController *tabBarController;
	ServerGetData *getData;

}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainNavigationController *mainNavigationController;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) ServerLogin *serverLogin;
@property (nonatomic, retain) ServerCreateUser *serverCreate;
@property (nonatomic, retain) MainUITabBarController *tabBarController;
@property (nonatomic, retain) ServerGetData *getData;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end

