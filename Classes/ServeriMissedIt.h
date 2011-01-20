//
//  ServeriMissedIt.h
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessagePassProtocol.h"
#import "Announcement.h"

#define POST	1
#define GET		0

@interface ServeriMissedIt : NSObject {
	NSURLConnection *dataConnection;
	int statusCode;
	id <MessagePassProtocol> delegate2;
	NSString *responseData;
	NSMutableString *allData;
	NSMutableArray *annoucements; 
	int state;
}

@property (nonatomic, retain) NSURLConnection *dataConnection;
@property (nonatomic, retain) NSString *responseData;
@property (nonatomic, retain) NSMutableString *allData;
@property (nonatomic, retain) NSMutableArray *annoucements; 
@property (nonatomic) int statusCode;
@property (nonatomic) int state;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(void) getDataForScreen_name:(NSString *)screen_name 
				 andLectureId:(NSString *)lecture
				 andSessionId:(NSString *)session_id;

- (NSString *)urlEncodeValue:(NSString *)str;

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error;

@end
