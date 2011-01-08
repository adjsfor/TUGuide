//
//  MapListDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 07.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListDetailView.h"


@interface MapListDetailViewController : UIViewController {
	MapListDetailView *detailView;
	
}

@property (nonatomic, retain) MapListDetailView *detailView;

@end
