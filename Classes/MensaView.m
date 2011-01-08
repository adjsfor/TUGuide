//
//  MensaView.m
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaView.h"


@implementation MensaView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"MensaLogoBlue.png"];
		UIImageView *mensaBlue = [[UIImageView alloc] initWithFrame:CGRectMake(20,30, 120, 120)];
		mensaBlue.image = img;
		[img release];
		[self addSubview:mensaBlue];
		[mensaBlue release];
		
		img = [UIImage imageNamed: @"MensaLogoRed.png"];
		UIImageView *mensaRed = [[UIImageView alloc] initWithFrame:CGRectMake(180,30, 120, 120)];
		mensaRed.image = img;
		[img release];
		[self addSubview:mensaRed];
		[mensaRed release];
		
		img = [UIImage imageNamed: @"MensaLogoGreen.png"];
		UIImageView *mensaGreen = [[UIImageView alloc] initWithFrame:CGRectMake(20,220, 120, 120)];
		mensaGreen.image = img;
		[img release];
		[self addSubview:mensaGreen];
		[mensaGreen release];
		
		img = [UIImage imageNamed: @"MensaLogoOrange.png"];
		UIImageView *mensaOrange = [[UIImageView alloc] initWithFrame:CGRectMake(180,220, 120, 120)];
		mensaOrange.image = img;
		[img release];
		[self addSubview:mensaOrange];
		[mensaOrange release];
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
