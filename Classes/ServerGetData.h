//
//  ServerGetData.h
//  TUGuide
//
//  Created by Jakub Kolesik on 06.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataPassProtocol.h"

#define BUILDINGS   0
#define MENSA		1
#define RESTAURANT  2
#define CLASSROOM   3



@interface ServerGetData : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <DataPassProtocol> delegate2;
	NSString *responseData;
	NSMutableString *allRecievedData;
	NSString *staticURL;
	int command;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSMutableString *allRecievedData;
@property (nonatomic) int statusCode;
@property (nonatomic) int command;
@property (nonatomic,assign) id <DataPassProtocol> delegate2;
@property (nonatomic, retain) NSString *staticURL;


-(void) getAllBuildings;
-(void) getAllClassrooms;
-(void) getAllMensas;
-(void) getAllRestaurants;


-(id)initWithURL;
-(void) send:(NSString *)message;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;


@end
