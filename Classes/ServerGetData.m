//
//  ServerGetData.m
//  TUGuide
//
//  Created by Jakub Kolesik on 06.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "ServerGetData.h"


@implementation ServerGetData

@synthesize dataConnection;
@synthesize statusCode,delegate2,responseData,allRecievedData,staticURL,command;



-(void) getAllBuildings{
	self.command = BUILDINGS;
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSMutableString *completeURL = [[NSMutableString alloc] initWithString:staticURL];
	[completeURL appendString:@"Building"];
	
	[request setURL:[NSURL URLWithString:completeURL]];
	[request setHTTPMethod:@"GET"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[completeURL release];

	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}
-(void) getAllClassrooms{
	self.command = CLASSROOM;
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSMutableString *completeURL = [[NSMutableString alloc] initWithString:staticURL];
	[completeURL appendString:@"Classroom"];
	[request setURL:[NSURL URLWithString:completeURL]];
	[request setHTTPMethod:@"GET"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[completeURL release];
	
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(id)initWithURL{
	staticURL = [[NSString alloc] initWithString:@"http://hgmm.webhop.net:56789/"];
	return [self init];
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
	allRecievedData = [[NSMutableString alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	self.responseData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	if (responseData) {
		[allRecievedData appendString:responseData];
	}else {
		NSLog(@"Nill data recieved, encoding with ASCII");
		self.responseData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
		[allRecievedData appendString:responseData];
	}
	//NSLog(@"-SERVER: report received part-data");
	
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"-SERVER: report failed with error");
    NSLog(@"%@", [error description]);
	[delegate2 passingCommand:@"serverOffline" sender:-1 message:@"We are sorry but our server is offline, please try later!" data:nil];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //NSLog(@"-SERVER: connection finished loading with data : %@",allRecievedData );
	NSLog(@"-SERVER: connection finished loading with data.");
	if (self.statusCode == 200) {
		switch (command) {
			case BUILDINGS:
				[delegate2 passingCommand:@"dataRecieved" sender:BUILDINGS message:nil data:allRecievedData];
				break;
			case RESTAURANT:
				[delegate2 passingCommand:@"dataRecieved" sender:RESTAURANT message:nil data:allRecievedData];
				break;
			case MENSA:
				[delegate2 passingCommand:@"dataRecieved" sender:MENSA message:nil data:allRecievedData];
				break;
			case CLASSROOM:
				[delegate2 passingCommand:@"dataRecieved" sender:CLASSROOM message:nil data:allRecievedData];
				break;
			default:
				break;
		}
	}else {
		[delegate2 passingCommand:@"dataRecievedFailed" sender:-1 message:@"There was a problem in downloading the data, please try again later" data:nil];
	}
	
}

-(void) dealloc{
	[dataConnection release];
	[responseData release];
	[allRecievedData release];
	[super dealloc];
}


@end