//
//  MensaDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mensa.h"
#import "MensaDetailView.h"

@interface MensaDetailViewController : UIViewController {
	
	Mensa *mensa;
	MensaDetailView *detailView;

}

@property (nonatomic, retain) Mensa *mensa;
@property (nonatomic, retain) MensaDetailView *detailView;

-(id)initWithMensa:(Mensa *) m;

@end
