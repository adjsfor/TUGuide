//
//  MensaView.m
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaView.h"


@implementation MensaView

@synthesize mensaBlue, mensaGreen, mensaRed, mensaOrange;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		mensaBlue = [UIButton buttonWithType:UIButtonTypeCustom];
		[mensaBlue setFrame:CGRectMake(20,10, 110, 160)];
		[mensaBlue setBackgroundImage:[UIImage imageNamed:@"MensaLogoBlue.png"] forState:UIControlStateNormal];
		[self addSubview:mensaBlue];
		
		mensaRed = [UIButton buttonWithType:UIButtonTypeCustom];
		[mensaRed setFrame:CGRectMake(180,10, 110, 160)];
		[mensaRed setImage:[UIImage imageNamed:@"MensaLogoRed.png"] forState:UIControlStateNormal];
		[self addSubview:mensaRed];
		
		mensaGreen = [UIButton buttonWithType:UIButtonTypeCustom];
		[mensaGreen setFrame:CGRectMake(20,190, 110, 160)];
		[mensaGreen setImage:[UIImage imageNamed:@"MensaLogoGreen.png"] forState:UIControlStateNormal];
		[self addSubview:mensaGreen];
		
		mensaOrange = [UIButton buttonWithType:UIButtonTypeCustom];
		[mensaOrange setFrame:CGRectMake(180,190, 110, 160)];
		[mensaOrange setImage:[UIImage imageNamed:@"MensaLogoOrange.png"] forState:UIControlStateNormal];
		[self addSubview:mensaOrange];
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
