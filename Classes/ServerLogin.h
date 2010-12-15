//
//  ServerLogin.h
//  TUGuide
//
//  Created by Jakub Kolesik on 11/30/10.
//  Copyright 2010 TUWIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"


@interface ServerLogin : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <MessagePassProtocol> delegate2;
	NSString *responseData;
}



@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic) int statusCode;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void) loginUserWithScreen_name:(NSString *)screen_name 
					withPassword:(NSString *)password;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
