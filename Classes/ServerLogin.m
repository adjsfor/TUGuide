//
//  ServerLogin.m
//  TUGuide
//
//  Created by Jakub Kolesik on 11/30/10.
//  Copyright 2010 TUWIEN. All rights reserved.
//

#import "ServerLogin.h"


@implementation ServerLogin
@synthesize dataConnection;
@synthesize statusCode,delegate2,responseData;



-(void) loginUserWithScreen_name:(NSString *)screen_name 
					 withPassword:(NSString *)password{
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/login"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&password=%@",
							 screen_name, password];
	[request setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
	[requestBody release];
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
	[responseData release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"-SERVER: report failed with error");
    NSLog(@"%@", [error description]);
	[delegate2 passing:self command:@"serverOffline" message:@"We are sorry but our server is offline, please try later!"];
	[dataConnection release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"-SERVER: connection finished loading");
	if (self.statusCode == 200) {
		[delegate2 passing:self command:@"loginSuccessful" message:@"Login has been successful!"];
	}else {
		[delegate2 passing:self command:@"loginFail" message:@"Username/Password information incorrect, please try again!"];
	}
	[dataConnection release];
}

-(void) dealloc{
	[super dealloc];
}


@end
