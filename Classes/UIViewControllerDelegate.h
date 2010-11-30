//
//  UIViewControllerDelegate.h
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIViewControllerDelegate
// used to pass event from UIView to UIViewController
-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end
