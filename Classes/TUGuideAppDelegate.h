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
#import	"ServerLogin.h"

@interface TUGuideAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate,MessagePassProtocol> {
    UIWindow *window;
	MainNavigationController *mainNavigationController;
	User *me;
	ServerLogin *server;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainNavigationController *mainNavigationController;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) ServerLogin *server;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end

