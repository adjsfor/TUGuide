//
//  FoodViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/8/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewControllerDelegate.h"
#import "MessagePassProtocol.h"
#import "StubViewController.h"

@interface FoodViewController : UIViewController {
	UISegmentedControl *segmentedController;
	StubViewController *stubViewController;
	id <MessagePassProtocol> delegate2;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) StubViewController *stubViewController;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;



-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;


@end