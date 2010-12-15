//
//  UIElementDelegate.h
//  TUGuide
//
//  Created by Jakub Kolesik on 15.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIElementDelegate

-(void)sendedByButton:(UIButton *)button command:(NSString *)cmd; 
-(void)sendedByTextfield:(UITextField *)textField command:(NSString *)cmd; 
@end
