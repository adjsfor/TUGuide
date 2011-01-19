//
//  MensaDetailView.m
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaDetailView.h"


@implementation MensaDetailView

@synthesize logo, header, menu, contentTable, name, color;

- (id)initWithFrame:(CGRect)frame andName:(NSString *)n{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		
		self.name = n;
		//UIColor *color = [[UIColor alloc] init];
		
		UIImageView *headerBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, 320, 120)];
		UIImage *bimage = [UIImage imageNamed:@"HeaderBackground"];
		headerBackground.image = bimage;
		[self addSubview:headerBackground];
		[headerBackground release];
		
		if ([name isEqualToString:@"Mensa Markt & M-Cafe Freihaus"]) {
			UIImage *img = [UIImage imageNamed: @"MensaLogoBlue.png"];
			logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 70, 90)];
			logo.image = img;
			[img release];
			color = [UIColor colorWithRed:.13 green:.33 blue:.92 alpha:1];
			[self addSubview:logo];
			[logo release];
		} else if ([name isEqualToString:@"Cafe Schrödinger im Freihaus"]){
			UIImage *img = [UIImage imageNamed: @"MensaLogoRed.png"];
			logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 70, 90)];
			logo.image = img;
			color = [UIColor colorWithRed:.77 green:.12 blue:.16 alpha:1];
			[img release];
			[self addSubview:logo];
			[logo release];
			
		} else if ([name isEqualToString:@"Buffet Getreidemarkt"]) {
			UIImage *img = [UIImage imageNamed: @"MensaLogoGreen.png"];
			logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 70, 90)];
			logo.image = img;
			color = [UIColor colorWithRed:.19 green:.67 blue:.04 alpha:1];
			[img release];
			[self addSubview:logo];
			[logo release];
		} else if ([name isEqualToString:@"Buffet Gußhausstraße"]) {
			UIImage *img = [UIImage imageNamed: @"MensaLogoOrange.png"];
			logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 70, 90)];
			logo.image = img;
			color = [UIColor colorWithRed:.99 green:.65 blue:.00 alpha:1];
			[img release];
			[self addSubview:logo];
			[logo release];
		}
		
		header = [[UILabel alloc]initWithFrame:CGRectMake(100,50, 220, 50)];
		header.font = [UIFont fontWithName:@"Helvetica" size:20]; 
		header.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
		header.textColor = color;
		[self addSubview:header];
		[header release];
		
		contentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 267)];
		[self addSubview:contentTable];
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
