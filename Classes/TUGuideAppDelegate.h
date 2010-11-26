//
//  TUGuideAppDelegate.h
//  TUGuide
//
//  Created by Adrian Djokic on 11/3/10.
//  Copyright 2010 Bundesrechenzentrum. All rights reserved.
// Das ist testing von SCM ivo
// bla bla balb la

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface TUGuideAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	LoginViewController *loginViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) LoginViewController *loginViewController;

@end

