//
//  LecturesDetailController.h
//  TUGuide
//
//  Created by Martin Langeder on 14.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesDetailView.h"


@interface LecturesDetailController : UIViewController {
	LecturesDetailView *detailView;
}

@property (nonatomic, retain) LecturesDetailView *detailView;

@end
