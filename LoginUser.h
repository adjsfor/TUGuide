//
//  LoginUser.h
//  TUGuide
//
//  Created by Jakub Kolesik on 20.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.



#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "MessagePassProtocol.h"
#import "ServerLogin.h"
#import "ServerCreateUser.h";
//#import "application_headers" as required


@interface LoginUser : SenTestCase <MessagePassProtocol>{
	ServerLogin *server;
	ServerCreateUser *create;
}

@property (nonatomic, retain) ServerLogin *server;
@property (nonatomic, retain) ServerCreateUser *create;

-(void) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail 
					   andPassword:(NSString *)pass;

-(void) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass;


@end
