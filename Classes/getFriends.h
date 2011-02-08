//
//  getFriends.h
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"
#import "User.h"
#import "Friend.h"



@interface getFriends : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <MessagePassProtocol> delegate2;
	NSString *responseData;
	
	NSAutoreleasePool *autoReleasePool;
	
	NSMutableString *allData;
	User * me;
	NSMutableArray *friends;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSMutableString *allData;
@property (nonatomic, retain) NSMutableArray *friends;
@property (nonatomic, retain) NSAutoreleasePool *autoReleasePool;
@property (nonatomic, retain) User * me;
@property (nonatomic) int statusCode;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(id) initWithUser:(User *)u;

-(void) startProcessing;

-(void) processing;

-(void) dataCall;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
