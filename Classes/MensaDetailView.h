//
//  MensaDetailView.h
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MensaMenu.h"


@interface MensaDetailView : UIView {
	
	UIImageView *logo;
	UILabel *header;
	MensaMenu *menu;
	UITableView *contentTable;

}

@property (nonatomic, retain) UIImageView *logo;
@property (nonatomic, retain) UILabel *header;
@property (nonatomic, retain) MensaMenu *menu;
@property (nonatomic, retain) UITableView *contentTable;



@end
