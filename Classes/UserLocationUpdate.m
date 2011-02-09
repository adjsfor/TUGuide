//
//  UserLocationUpdate.m
//  TUGuide
//
//  Created by Ivo Galic on 2/9/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "UserLocationUpdate.h"


@implementation UserLocationUpdate

@synthesize dataConnection,allData,annoucements;
@synthesize statusCode,delegate2,responseData,state;


-(void) sendMyGps:(NSString *)screen_name 
					andSessionId:(NSString *)session_id
			   andCoordinatesLat:(NSString *)coordinates_lat
			   andCoordinatesLon:(NSString *)coordinates_lon
{


	allData = [[NSMutableString alloc] init];
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://hgmm.webhop.net:56789/User/Update"]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	NSString *requestBody = [[NSString alloc]
							 initWithFormat:@"coordinates_lat=%@&coordinates_lon=%@&session_id=%@&screen_name=%@",
							 coordinates_lat, coordinates_lon, session_id,screen_name];
	XLog(" %@" ,requestBody);
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
		XLog("locationUpdated");
			[delegate2 passing:self command:@"locationUpdated" message:nil];
	}else {
		//[delegate2 passing:self command:@"loginFail" message:@"Username/Password information incorrect, please try again!"];
		[allData release];
		[delegate2 passing:self command:@"locationUpdateFail" message:nil];
	}
	//[dataConnection release];
}

-(void) dealloc{
	[super dealloc];
}


@end
