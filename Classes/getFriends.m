//
//  getFriends.m
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "getFriends.h"


@implementation getFriends
@synthesize dataConnection,me,allData;
@synthesize statusCode,delegate2,responseData,friends;

-(id) initWithUser:(User *)u{
	me = u;
	return [self init];
}

-(void) startProcessing{
	[NSThread detachNewThreadSelector:@selector(processing) toTarget:self withObject:nil];
}

-(void) processing{
	while (YES) {
		[self dataCall];
		[NSThread sleepForTimeInterval:10.0];
	}
}

-(void) dataCall{
	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/Friend/"]];
	[request setHTTPMethod:@"GET"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&session_id=%@",
							 me.screenName, me.sessionId];
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
	[allData appendString:responseData];
	[responseData release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"-SERVER: report failed with error");
    NSLog(@"%@", [error description]);
	[delegate2 passing:self command:@"serverOffline" message:@"We are sorry but our server is offline, please try later!"];
	[dataConnection release];
	[allData release];
	[me release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"-SERVER: connection finished loading");
	if (self.statusCode == 200) {
		//
		NSData *plistData = [allData dataUsingEncoding:NSUTF8StringEncoding];
		NSString *error;
		NSPropertyListFormat format;
		NSMutableArray* array;
		NSMutableDictionary* myDict;
		Friend *f;
		//END
		array = [NSPropertyListSerialization propertyListFromData:plistData
												 mutabilityOption:NSPropertyListImmutable
														   format:&format
												 errorDescription:&error];
		if (array) {
			myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
			friends = [[NSMutableArray alloc] init];
			for (NSDictionary* dict in array) {
				f = [Friend customClassWithProperties:dict];
				[friends addObject:f];
				//[b release];
			}
			[delegate2 passing:self command:@"finished" message:@"Data form server friends"];
		} else {
			NSLog(@"Plist Buildings does not exist, error:%@",error);
		}
				
		//[myDict release];
		//[plistData release];
		//[error release];
		//[array release];
		
	}else {
		//[delegate2 passing:self command:@"loginFail" message:@"Username/Password information incorrect, please try again!"];
		[me release];
		[allData release];
	}
	[dataConnection release];
}

-(void) dealloc{
	[super dealloc];
}


@end
