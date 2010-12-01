//
//  MainNavigationController.h
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "RegisterLoginViewController.h"
#import "UIViewControllerDelegate.h"
#import "RegisterViewController.h"
#import "MessagePassProtocol.h"


@interface MainNavigationController : UINavigationController <UIViewControllerDelegate> {
	LoginViewController *loginViewController;
	RegisterLoginViewController *registerLoginViewController;
	RegisterViewController *registerViewController;
	id <MessagePassProtocol> delegate2;
}
@property (nonatomic, retain) LoginViewController *loginViewController;
@property (nonatomic, retain) RegisterLoginViewController *registerLoginViewController;
@property (nonatomic, retain) RegisterViewController *registerViewController;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void)switchToController:(NSString *)controller animated:(BOOL)animated;
-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg; // delegate

@end
