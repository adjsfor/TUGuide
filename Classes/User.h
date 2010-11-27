//
//  User.h
//  TUGuide
//
//  Created by Martin Langeder on 27.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject {
	int userId;
	NSString *screenName;
	NSString *email;
	NSString *password;
	NSString *coordinates;
	NSString *verificationString;
	bool activated;
	NSString *sessionId;
	NSDate *lastLogin;
	
}

@property (nonatomic) int *userId;
@property (nonatomic) NSString *screenName;
@property (nonatomic) NSString *email;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *coordinates;
@property (nonatomic) NSString *verificationString;
@property (nonatomic) bool activated;
@property (nonatomic) NSString *sessionId;
@property (nonatomic) NSDate *lastLogin;

-(id)init;
-(id)initWithEmailAndPassword: (NSString *)em password:(NSString *)pw;
-(id)initWithEmailPasswordAndScreenName:(NSString *)em password:(NSString *)pw user:(NSString *)u;

@end
