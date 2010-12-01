//
//  MessagePassProtocol.h
//  TUGuide
//
//  Created by Ivo Galic on 12/1/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MessagePassProtocol
// used to send some commands between GUI and SERVICE 
-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end
