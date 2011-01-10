//
//  tuAnnotation.h
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import <MapKit/MapKit.h>

@interface TUAnnotation : NSObject <MKAnnotation>
{
    NSNumber *latitude;
    NSNumber *longitude;
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;


@end
