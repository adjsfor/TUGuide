//
//  RegisterLoginView.m
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "RegisterLoginView.h"


@implementation RegisterLoginView

@synthesize registerButton;
@synthesize loginButton;
@synthesize bigLogo;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		self.backgroundColor = [UIColor whiteColor];
		registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		registerButton.frame = CGRectMake(100, 170, 100, 30);
		[registerButton setTitle:@"test" forState:UIControlStateNormal];
		[self addSubview:registerButton];
		[registerButton release];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
