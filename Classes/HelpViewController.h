//
//  HelpViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelpViewController : UIViewController <UIScrollViewDelegate> {
	IBOutlet UIScrollView *scrollView;
	UIImageView *imageView;
	UIView *view;
}

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIImageView *imageView;

@end
