//
//  ServerCreateUser.m
//  TUGuide
//
//  Created by Jakub Kolesik on 15.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "ServerCreateUser.h"


@implementation ServerCreateUser
@synthesize dataConnection;
@synthesize statusCode,delegate2,responseData;



-(void) createUserWithScreen_name:(NSString *)screen_name 
					 withPassword:(NSString *)password 
						 withMail:(NSString *)mail{
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/create"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&email=%@&password=%@",
							 screen_name,mail, password];
	[request setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (NSString *)urlEncodeValue:(NSString *)str
{
	NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8);
	return [result autorelease];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"-SERVER: report received response");
	if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
		self.statusCode = [(NSHTTPURLResponse *)response statusCode];
	}
	NSLog(@"The code is: %i", statusCode );	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	self.responseData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
	NSLog(@"-SERVER: report received data %@",responseData);
	if (self.statusCode == 200) {
		[delegate2 passing:self command:@"registerSuccessful" message:@"Creating user has been successful!"];
	}else {
		[delegate2 passing:self command:@"registerFail" message:@"Username/Password/mail information incorrect, please try again!"];
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"-SERVER: report failed with error");
    NSLog(@"%@", [error description]);
	[delegate2 passing:self command:@"serverOffline" message:@"We are sorry but our server is offline, please try later!"];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"-SERVER: connection finished loading");
}

-(void) dealloc{
	[dataConnection release];
	[super dealloc];
}


@end

