//
//  MapListDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 07.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListDetailView.h"
#import "LocationDetailViewController.h"


@interface MapListDetailViewController : UIViewController {
	MapListDetailView *detailView;
	Classroom *c;
	
}

@property (nonatomic, retain) MapListDetailView *detailView;
@property (nonatomic, retain) Classroom *c;

-(id)initWithClassroom:(Classroom *)classr;
-(void)showLocationPdf:(id)sender;

@end
