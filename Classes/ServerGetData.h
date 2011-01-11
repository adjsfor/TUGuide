//
//  ServerGetData.h
//  TUGuide
//
//  Created by Jakub Kolesik on 06.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataPassProtocol.h"
#import "Building.h"
#import "Classroom.h"
#import "Restaurant.h"
#import "Mensa.h"
#import "MensaMenu.h"

#define BUILDINGS   0
#define MENSA		1
#define RESTAURANT  2
#define CLASSROOM   3

#define ALL			10
#define ONE			11



@interface ServerGetData : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <DataPassProtocol> delegate2;
	NSString *responseData;
	NSMutableString *allRecievedData;
	NSString *staticURL;
	int command;
	int load;
	
	NSMutableArray *buildings;
	NSMutableArray *classrooms;
	NSMutableArray *restaurants;
	NSMutableArray *mensas;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSMutableString *allRecievedData;
@property (nonatomic) int statusCode;
@property (nonatomic) int command;
@property (nonatomic) int load;
@property (nonatomic,assign) id <DataPassProtocol> delegate2;
@property (nonatomic, retain) NSString *staticURL;

@property (nonatomic, retain) NSMutableArray *buildings;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, retain) NSMutableArray *restaurants;
@property (nonatomic, retain) NSMutableArray *mensas;


-(void) getAllBuildings;
-(void) getAllClassrooms;
-(void) getAllMensas;
-(void) getAllRestaurants;

-(NSMutableArray *) getAllBuildingsAsArray;
-(NSMutableArray *) getAllClassroomsAsArray;
-(NSMutableArray *) getAllRestaurantsAsArray;
-(NSMutableArray *) getAllMensasAsArray;


-(id)initWithURL;
-(id)initAll;

-(void)saveObject:(int)obj withData:(NSString *)data;

-(void) send:(NSString *)message;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;


@end
