//
//  MensaMenu.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "MensaMenu.h"


@implementation MensaMenu

@synthesize mesnaMenuId;
@synthesize mensaId;
@synthesize date;
@synthesize name;
@synthesize content;


-(id)init{
	return [super self];
}


-(void)dealloc{
	[date release];
	[name release];
	[content release];
    [super dealloc]	;
}


@end
