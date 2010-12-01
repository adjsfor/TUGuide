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

-(void) loginUser2WithScreen_name:(NSString *)screen_name 
					withPassword:(NSString *)password{
	/*
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
	*/
	NSURL *url = [NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/login"];
	
	NSMutableURLRequest *loginRequest = [NSMutableURLRequest requestWithURL:url];
	
	[loginRequest setHTTPMethod:@"POST"];
	
	//set headers
	
	[loginRequest addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	
	[loginRequest addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	
	/*NSString *requestBody = [[NSString alloc]
							 
							 initWithFormat:@"screen_name=%@&amp;password=%@",
							 
							 screen_name, password];
	 */
	NSString *requestBody = [[NSString alloc]
							 
							 initWithFormat:@"screen_name=%@&password=%@",
							 
							 screen_name, password];
	
	[loginRequest setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
	
	
	//dataConnection=[[NSURLConnection alloc] initWithRequest:loginRequest delegate:self];
	
	NSHTTPURLResponse *response = NULL;
	
	//NSData *responseData = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse:response error:nil];
	
	NSData *responseData = [NSURLConnection sendSynchronousRequest:loginRequest returningResponse: response error:nil];
	
	NSString *responseDataString = [[NSString alloc] initWithData:responseData encoding:NSASCIIStringEncoding];
	
	NSLog(@"Response: %@", responseDataString);
	
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
