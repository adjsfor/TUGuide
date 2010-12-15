//
//  annotationView.m
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "annotationView.h"


@implementation annotationView

@synthesize imageView;

#define kHeight 40
#define kWidth  37
#define kBorder 2

-(id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	tuAnnotation *myAnnotation = (tuAnnotation*)annotation;
	
	if ([myAnnotation annotationType] == tuAnnotationTypeUni) 
	{
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
		
		imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tuLogo.png"]];
		imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
		[self addSubview:imageView];
	}
	else if ([myAnnotation annotationType] == tuAnnotationTypeMensa)
	{
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:reuseIdentifier];
		self.frame = CGRectMake(0, 0, kWidth, kHeight);
		self.backgroundColor = [UIColor clearColor];
		
		imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo.png"]];
		imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
		[self addSubview:imageView];
	}
	
	[imageView setContentMode:UIViewContentModeScaleAspectFill];
	
	return self;
}

		

@end
