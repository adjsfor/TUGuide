//
//  Classroom.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Classroom.h"


@implementation Classroom

@synthesize classroomId;
@synthesize address;
@synthesize name;
@synthesize location;
@synthesize type;
@synthesize pdf_link_wegweiser;
@synthesize pdf_link_cms;
@synthesize link;
@synthesize id;
@synthesize created;
@synthesize updated;
@synthesize building_id;

//@synthesize building;

+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		//[self setValuesForKeysWithDictionary:properties];
		self.address = [properties objectForKey:@"address"];
		self.name = [properties objectForKey:@"name"];
		self.location =[properties objectForKey:@"location"];
		self.type = [properties objectForKey:@"type"];;
		self.pdf_link_cms = [properties objectForKey:@"pdf_link_cms"];
		self.pdf_link_wegweiser = [properties objectForKey:@"pdf_link_wegweiser"];
		self.link = [properties objectForKey:@"link"];
		self.id = (int)[properties objectForKey:@"id"];
		self.created = [properties objectForKey:@"created"];
		self.updated = [properties objectForKey:@"updated"];
		self.building_id = (int)[properties objectForKey:@"building_id"];
		
		//if([properties objectForKey:@"Building"] != nil){
			//self.building = [Building customClassWithProperties:[properties objectForKey:@"Building"]];
		//}else {
			//NSLog(@"Classroom has one building_id but no building variable, saving nil for building");
		//}

	}
	return self;
}

-(void)dealloc{
	[name release];
	[address release];
	[location release];
	[type release];
	[pdf_link_cms release];
	[pdf_link_wegweiser release];
	[link release];
	[created release];
	[updated release];
	//[building release];
	[super dealloc];
}

@end
