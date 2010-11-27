//
//  User.h
//  TUGuide
//
//  Created by Ivo Galic on 27.11.10.
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

@property (nonatomic) int userId;
@property (nonatomic,assign) NSString *screenName;
@property (nonatomic,assign) NSString *email;
@property (nonatomic,assign) NSString *password;
@property (nonatomic,assign) NSString *coordinates;
@property (nonatomic,assign) NSString *verificationString;
@property (nonatomic) bool activated;
@property (nonatomic,assign) NSString *sessionId;
@property (nonatomic,assign) NSDate *lastLogin;

-(id)init;
-(id)initWithEmailAndPassword: (NSString *)em withPassword:(NSString *)pw;
-(id)initWithArguments:(NSString *)email withPassword:(NSString *)pw withScreenName:(NSString *)u;

@end
