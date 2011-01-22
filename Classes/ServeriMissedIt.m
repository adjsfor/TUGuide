//
//  ServeriMissedIt.m
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "ServeriMissedIt.h"


@implementation ServeriMissedIt
@synthesize dataConnection,allData,annoucements;
@synthesize statusCode,delegate2,responseData,state;



-(void) getDataForScreen_name:(NSString *)screen_name 
				 andLectureId:(NSString *)lecture
				 andSessionId:(NSString *)session_id{
	state = GET;
	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/iMissedIt/announcements"]];
	[request setHTTPMethod:@"GET"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&session_id=%@&lecture_id=%@",
							 screen_name, session_id,lecture];
	[request setHTTPBody:[requestBody dataUsingEncoding:NSASCIIStringEncoding]];
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
	[requestBody release];
}

-(void) setDataForScreen_name:(NSString *)screen_name 
				 andLectureId:(NSString *)lecture
				 andSessionId:(NSString *)session_id
				   andMessage:(NSString *)message{
	state = POST;
	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/iMissedIt/announce"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&session_id=%@&lecture_id=%@&message=%@",
							 screen_name, session_id,lecture,message];
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
	if(state==POST){
		[dataConnection release];
		[allData release];
	}
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
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"-SERVER: connection finished loading");
	if (self.statusCode == 200) {
		//[delegate2 passing:self command:@"loginSuccessful" message:@"Login has been successful!"];
		NSData *plistData = [allData dataUsingEncoding:NSUTF8StringEncoding];
		NSString *error;
		NSPropertyListFormat format;
		NSMutableArray* array;
		NSMutableDictionary* myDict;
		Announcement *a;
		//END
		array = [NSPropertyListSerialization propertyListFromData:plistData
												 mutabilityOption:NSPropertyListImmutable
														   format:&format
												 errorDescription:&error];
		if (array) {
			myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
			annoucements = [[NSMutableArray alloc] init];
			for (NSDictionary* dict in array) {
				a = [Announcement customClassWithProperties:dict];
				[annoucements addObject:a];
				//[b release];
			}
		} else {
			NSLog(@"Plist Buildings does not exist, error:%@",error);
		}
		
		//[myDict release];
		//[plistData release];
		//[error release];
		//[array release];
		[delegate2 passing:self command:@"iMissedItDataRecieved" message:nil];
		
	}else {
		//[delegate2 passing:self command:@"loginFail" message:@"Username/Password information incorrect, please try again!"];
		[allData release];
		[delegate2 passing:self command:@"iMissedItDataFailed" message:nil];
	}
	[dataConnection release];
}

-(void) dealloc{
	[super dealloc];
}


@end
