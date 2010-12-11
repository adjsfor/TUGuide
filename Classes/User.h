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
	NSMutableArray *friendList;
	
}

@property (nonatomic) int userId;
@property (nonatomic,retain) NSString *screenName;
@property (nonatomic,retain) NSString *email;
@property (nonatomic,retain) NSString *password;
@property (nonatomic,retain) NSString *coordinates;
@property (nonatomic,retain) NSString *verificationString;
@property (nonatomic) bool activated;
@property (nonatomic,retain) NSString *sessionId;
@property (nonatomic,retain) NSDate *lastLogin;
@property (nonatomic,retain) NSMutableArray *friendList;

-(id)init;
-(id)initWithEmailAndPassword: (NSString *)em withPassword:(NSString *)pw;
-(id)initWithArguments:(NSString *)email withPassword:(NSString *)pw withScreenName:(NSString *)u;

@end
