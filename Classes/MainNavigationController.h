//
//  MainNavigationController.h
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainNavigationController : UINavigationController {
	LoginViewController *loginViewController;
}
@property (nonatomic, retain) LoginViewController *loginViewController;

@end
