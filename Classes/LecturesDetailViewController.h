//
//  LecturesDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesDetailView.h"


@interface LecturesDetailViewController : UIViewController {
	LecturesDetailView *detailView;
}

@property (nonatomic, retain) LecturesDetailView *detailView;

@end


