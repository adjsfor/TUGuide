//
//  TabObjectViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/1/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessagePassProtocol.h"

@interface TabObjectViewController : UIViewController <MessagePassProtocol> {
	id <MessagePassProtocol> delegate2;
}

@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end
