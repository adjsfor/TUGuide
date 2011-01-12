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

@synthesize restaurants,mensas,classrooms,buildings,load;



-(void) getAllBuildings{
	self.command = BUILDINGS;
	[self send:@"Building"];
}
-(void) getAllClassrooms{
	self.command = CLASSROOM;
	[self send:@"Classroom"];
}

-(void) getAllRestaurants{
	self.command = RESTAURANT;
	[self send:@"Restaurant"];
}

-(void) getAllMensas{
	self.command = MENSA;
	[self send:@"Mensa"];
}

-(NSArray *) getAllBuildingsAsArray{
	return buildings;
}
-(NSArray *) getAllClassroomsAsArray{
	return classrooms;
}

-(NSArray *) getAllRestaurantsAsArray{
	return restaurants;
}

-(NSArray *) getAllMensasAsArray{
	return mensas;
}

-(void) send:(NSString *)message{
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	NSMutableString *completeURL = [[NSMutableString alloc] initWithString:staticURL];
	[completeURL appendString:message];
	[request setURL:[NSURL URLWithString:completeURL]];
	[request setHTTPMethod:@"GET"];
	[request addValue:@"Content-Type" forHTTPHeaderField:@"application/x-www-form-urlencoded"];
	[request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[completeURL release];
	
	dataConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(id)initWithURL{
	load=ONE;
	staticURL = [[NSString alloc] initWithString:@"http://hgmm.webhop.net:56789/"];
	return [self init];
}
-(id)initAll{
	[self initWithURL];
	load=ALL;
	[self getAllBuildings];
	return self;
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
		switch (load) {
			case ONE:
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
				break;
			case ALL:
				switch (command) {
					case BUILDINGS:
						[self saveObject:BUILDINGS withData:allRecievedData];
						[self getAllRestaurants];
						break;
					case RESTAURANT:
						[self saveObject:RESTAURANT withData:allRecievedData];
						[self getAllMensas];
						break;
					case MENSA:
						[self saveObject:MENSA withData:allRecievedData];
						[self getAllClassrooms];
						break;
					case CLASSROOM:
						[self saveObject:CLASSROOM withData:allRecievedData];
						[delegate2 passingCommand:@"allDataRecieved" sender:ALL message:nil data:nil];
						break;
					default:
						break;
				}
				break;

			default:
				break;
		}
	}else {
		[delegate2 passingCommand:@"dataRecievedFailed" sender:-1 message:@"There was a problem in downloading the data, please try again later" data:nil];
	}
	
}

-(void)saveObject:(int)obj withData:(NSString *)data{
	//NEEDET VARIABLES
	NSData *plistData = [data dataUsingEncoding:NSUTF8StringEncoding];
	NSString *error;
	NSPropertyListFormat format;
	NSMutableArray* array;
	NSMutableDictionary* myDict;
	Classroom *c;
	Building *b;
	Mensa *m;
	Restaurant *r;
	//END
	switch (obj) {
		case BUILDINGS:
			
			array = [NSPropertyListSerialization propertyListFromData:plistData
													 mutabilityOption:NSPropertyListImmutable
															   format:&format
													 errorDescription:&error];
			if (array) {
				myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
				buildings = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in array) {
					b = [Building customClassWithProperties:dict];
					[buildings addObject:b];
					//[b release];
				}
			} else {
				NSLog(@"Plist Buildings does not exist, error:%@",error);
			}
			break;
		case RESTAURANT:
			array = [NSPropertyListSerialization propertyListFromData:plistData
													 mutabilityOption:NSPropertyListImmutable
															   format:&format
													 errorDescription:&error];
			if (array) {
				myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
				restaurants = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in array) {
					r = [Restaurant customClassWithProperties:dict];
					[restaurants addObject:r];
					//[r release];
				}
			} else {
				NSLog(@"Plist Mensas does not exist, error:%@",error);
			}
			break;
		case MENSA:
			array = [NSPropertyListSerialization propertyListFromData:plistData
													 mutabilityOption:NSPropertyListImmutable
															   format:&format
													 errorDescription:&error];
			if (array) {
				myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
				mensas = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in array) {
					m = [Mensa customClassWithProperties:dict];
					[mensas addObject:m];
					//[m release];
				}
			} else {
				NSLog(@"Plist Mensas does not exist, error:%@",error);
			}
			break;
		case CLASSROOM:
			array = [NSPropertyListSerialization propertyListFromData:plistData
													 mutabilityOption:NSPropertyListImmutable
															   format:&format
													 errorDescription:&error];
			if (array) {
				myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
				classrooms = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in array) {
					c = [Classroom customClassWithProperties:dict];
					[classrooms addObject:c];
					//[c release];
				}
			} else {
				NSLog(@"Plist Classrooms does not exist, error:%@",error);
			}
			break;
		default:
			break;
	}
	//[myDict release];
	//[plistData release];
	//[error release];
	//[array release];
}


-(void) dealloc{
	[restaurants release];
	[mensas release];
	[classrooms release];
	[buildings release];
	[dataConnection release];
	[responseData release];
	[allRecievedData release];
	[super dealloc];
}


@end