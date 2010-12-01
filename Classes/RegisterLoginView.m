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
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
	
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(15,0, 290, 290)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[registerButton setFrame:CGRectMake(85, 320, 150, 30)];
		[registerButton setTitle:@"Register" forState:UIControlStateNormal];
		[registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[registerButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[registerButton addTarget:self action:@selector(registerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		
		[self addSubview:registerButton];
		
		
		loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[loginButton setFrame:CGRectMake(85, 370, 150, 30)];
		[loginButton setTitle:@"Login" forState:UIControlStateNormal];
		[loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[loginButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:loginButton];

    }
    return self;
}



- (IBAction)loginButtonPressed:(id)sender{
	[delegate actionButton:self command:@"Login" message:@"Switch me to Login View"];
}

- (IBAction)registerButtonPressed:(id)sender{
	[delegate actionButton:self command:@"Register" message:@"Switch me to Register View"];
}

- (void)dealloc {
	[bigLogo release];
	[registerButton release];
	[loginButton release];
    [super dealloc];
}


@end
