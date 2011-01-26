//
//  UIAlertView_Extended.h
//  TUGuide
//
//  Created by Martin Langeder on 26.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITextField, UILabel;
@interface UIAlertView (Extended)
- (UITextField*)addTextFieldWithValue:(NSString*)value label:(NSString*)label;
- (UITextField*)textFieldAtIndex:(NSUInteger)index;
- (NSUInteger)textFieldCount;
- (UITextField*)textField;
@end