//
//  UserLocationUpdate.h
//  TUGuide
//
//  Created by Ivo Galic on 2/9/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"


@interface UserLocationUpdate : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <MessagePassProtocol> delegate2;
	NSString *responseData;
	NSMutableString *allData;
	NSMutableArray *annoucements; 
	int state;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSMutableString *allData;
@property (nonatomic, retain) NSMutableArray *annoucements; 
@property (nonatomic) int statusCode;
@property (nonatomic) int state;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void) sendMyGps:(NSString *)screen_name 
	 andSessionId:(NSString *)session_id
andCoordinatesLat:(NSString *)coordinates_lat
andCoordinatesLon:(NSString *)coordinates_lon;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end