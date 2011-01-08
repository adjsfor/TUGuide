//
//  DataPassProtocol.h
//  TUGuide
//
//  Created by Jakub Kolesik on 08.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol DataPassProtocol
-(void)passingCommand:(NSString *)cmd sender:(int)sd message:(NSString *)msg data:(NSString *)data; 

@end
