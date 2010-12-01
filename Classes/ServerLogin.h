//
//  ServerLogin.h
//  TUGuide
//
//  Created by Jakub Kolesik on 11/30/10.
//  Copyright 2010 TUWIEN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ServerLogin : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
}


@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic) int statusCode;

-(void) createUserWithScreen_name:(NSString *)screen_name 
						withEmail:(NSString *)email 
					 withPassword:(NSString *)password;

-(void) loginUserWithScreen_name:(NSString *)screen_name 
					withPassword:(NSString *)password;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
