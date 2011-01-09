//
//  MensaViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MensaView.h"
#import "RestaurantViewController.h"
#import "MapListDetailViewController.h"

@interface MensaViewController : UIViewController {
	
	MensaView *mensaView;
	UISegmentedControl *segmentedController;

}

@property (nonatomic, retain) MensaView *mensaView;
@property (nonatomic, retain) UISegmentedControl *segmentedController;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (void)mensaBlueAction:(id)sender;
- (void)mensaRedAction:(id)sender;
- (void)mensaGreenAction:(id)sender;
- (void)mensaOrangeAction:(id)sender;

@end