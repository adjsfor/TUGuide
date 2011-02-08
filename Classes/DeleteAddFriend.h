//
//  DeleteAddFriend.h
//  TUGuide
//
//  Created by Jakub Kolesik on 08.02.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"
#import "Announcement.h"

#define DELETE	1
#define ADD		0

@interface DeleteAddFriend : NSObject {
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

-(void) deleteFriendforMyScreenName:(NSString *)screen_name 
					   andSessionId:(NSString *)session_id
				andFriendScreenName:(NSString *)friendName;

-(void) addFriendforMyScreenName:(NSString *)screen_name 
					andSessionId:(NSString *)session_id
			 andFriendScreenName:(NSString *)friendName;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end