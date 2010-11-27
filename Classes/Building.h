//
//  Building.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Building : NSObject {
	int buildingid;
	NSString *name;
	NSString *address;
	NSString *coordinates;
	
}


@property (nonatomic) int buildingid;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) NSString *address;
@property (nonatomic,assign) NSString *coordinates;





@end
