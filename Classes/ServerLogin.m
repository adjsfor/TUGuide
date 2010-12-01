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
@synthesize statusCode;

-(void) createUserWithScreen_name:(NSString *)screen_name 
						withEmail:(NSString *)email 
					 withPassword:(NSString *)password{
	NSString *post = (@"screen_name=%s&email=%s&password=%s", screen_name, email, password);
	post = [self urlEncodeValue:post];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/create"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"plain/text" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void) loginUserWithScreen_name:(NSString *)screen_name 
					 withPassword:(NSString *)password{
	NSString *post = (@"screen_name=%s&password=%s", screen_name, password);
	post = [self urlEncodeValue:post];
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/login"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"plain/text" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];
	
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (NSString *)urlEncodeValue:(NSString *)str
{
	NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8);
	return [result autorelease];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"report received response");
	if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
		self.statusCode = [(NSHTTPURLResponse *)response statusCode];
	}
	NSLog(@"The code is: %i", statusCode );
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"report received data");
	//NSLog(@"%@", [data description]);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"report failed with error");
    NSLog(@"%@", [error description]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"connection finished loading");
}

-(void) dealloc{
	[dataConnection release];
	[super dealloc];
}


@end
