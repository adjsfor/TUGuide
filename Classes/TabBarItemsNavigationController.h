//
//  TabBarItemsNavigationController.h
//  TUGuide
//
//  Created by Ivo Galic on 12/31/10.
//  Copyright 2010 Galic Design. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MessagePassProtocol.h"
#import "TabObjectViewController.h"


@interface TabBarItemsNavigationController : UINavigationController <MessagePassProtocol> {
	id <MessagePassProtocol> delegate2;
	TabObjectViewController * tabObjectViewController;
}

@property (nonatomic, retain) TabObjectViewController * tabObjectViewController;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; // delegate
- (id)initWithRootViewControllerAndAddDelegate:(TabObjectViewController *)rootViewController; // special method for delegate



@end
