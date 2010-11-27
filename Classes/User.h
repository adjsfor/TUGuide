//
//  User.h
//  TUGuide
//
//  Created by Martin Langeder on 27.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface User : NSObject {
	
	NSString *username;
	NSString *password;
	NSString *email;
}

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *email;

-(id)init;
-(id)initWithEmailAndPassword: (NSString *)em password:(NSString *)pw;
-(id)initWithEmailPasswordAndUsername:(NSString *)em password:(NSString *)pw user:(NSString *)u;

@end
