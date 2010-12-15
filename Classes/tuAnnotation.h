//
//  tuAnnotation.h
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef enum {
	tuAnnotationTypeUni = 0,
	tuAnnotationTypeMensa = 1,
} TuAnnotationType;


@interface tuAnnotation : NSObject <MKAnnotation>
{
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
	TuAnnotationType annotationType;
}

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic) TuAnnotationType annotationType;

@end
