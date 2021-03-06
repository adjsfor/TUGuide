//
//  ServerCreateUser.h
//  TUGuide
//
//  Created by Jakub Kolesik on 15.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"


@interface ServerCreateUser : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <MessagePassProtocol> delegate2;
	NSString *responseData;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic) int statusCode;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void) createUserWithScreen_name:(NSString *)screen_name 
					 withPassword:(NSString *)password 
						 withMail:(NSString *)mail;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
