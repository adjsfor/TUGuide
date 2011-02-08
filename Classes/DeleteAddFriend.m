//
//  DeleteAddFriend.m
//  TUGuide
//
//  Created by Jakub Kolesik on 08.02.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "DeleteAddFriend.h"


@implementation DeleteAddFriend

@synthesize dataConnection,allData,annoucements;
@synthesize statusCode,delegate2,responseData,state;



-(void) deleteFriendforMyScreenName:(NSString *)screen_name 
					   andSessionId:(NSString *)session_id
				andFriendScreenName:(NSString *)friendName{
	state = DELETE;
	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/Friend/Delete"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&session_id=%@&my_screen_name=%@",
							 friendName, session_id,screen_name];
	[request setHTTPBody:[requestBody dataUsingEncoding:NSUTF8StringEncoding]];
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
	[requestBody release];
}

-(void) addFriendforMyScreenName:(NSString *)screen_name 
					andSessionId:(NSString *)session_id
			 andFriendScreenName:(NSString *)friendName{
	state = ADD;
	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/Friend/Add"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"screen_name=%@&session_id=%@&uuid=%@&my_screen_name=%@",
							 friendName, session_id,screen_name];
	[request setHTTPBody:[requestBody dataUsingEncoding:NSUTF8StringEncoding]];
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
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"-SERVER: connection finished loading");
	if (self.statusCode == 200) {
		if (state==ADD) {
			[delegate2 passing:self command:@"friendAdded" message:nil];
		}else if (state == DELETE) {
			[delegate2 passing:self command:@"friendDeleted" message:nil];
		}
		
	}else {
		//[delegate2 passing:self command:@"loginFail" message:@"Username/Password information incorrect, please try again!"];
		[allData release];
		[delegate2 passing:self command:@"friendFailed" message:nil];
	}
	//[dataConnection release];
}

-(void) dealloc{
	[super dealloc];
}


@end
