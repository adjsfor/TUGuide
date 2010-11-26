//
//  RegisterLoginView.h
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterLoginView : UIView {
	UIButton *registerButton;
	UIButton *loginButton;
	UIImage *bigLogo;
}

@property (nonatomic, retain) UIButton *registerButton;
@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UIImage *bigLogo;

@end
