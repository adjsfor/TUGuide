//
//  wizard.m
//  TUGuide
//
//  Created by Jakub Kolesik on 30.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "wizard.h"


@implementation Wizard

@synthesize skip;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        skip = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[skip setFrame:CGRectMake(240, 20, 80, 20)];
		[skip setTitle:@"Skip" forState:UIControlStateNormal];
		[skip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[skip setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[skip addTarget:self action:@selector(skipWizard:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:skip];
    }
	NSURL *url=[NSURL URLWithString:@"http://hgmm.webhop.net:56789/pdf/test.pdf"];
	[self loadRequest:[NSURLRequest requestWithURL:url]];
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

-(IBAction)skipWizard:(id)sender{
	
	
}

- (void)dealloc {
	[skip release];
    [super dealloc];
}


@end
