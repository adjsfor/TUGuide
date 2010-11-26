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
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(15,30, 290, 290)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[registerButton setFrame:CGRectMake(85, 350, 150, 30)];
		[registerButton setTitle:@"Register" forState:UIControlStateNormal];
		[registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[registerButton setBackgroundImage:[UIImage imageNamed: @"ButtonBackground.png"] forState:UIControlStateNormal];
		[registerButton addTarget:self action:@selector(GoToDateSettings:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:registerButton];
		
		loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[loginButton setFrame:CGRectMake(85, 400, 150, 30)];
		[loginButton setTitle:@"Login" forState:UIControlStateNormal];
		[loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		//[loginButton setBackgroundImage:[UIImage imageNamed: @"ButtonBackground.png"] forState:UIControlStateNormal];
		[loginButton addTarget:self action:@selector(GoToDateSettings:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:loginButton];

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
	[bigLogo release];
	[registerButton release];
    [super dealloc];
}


@end
