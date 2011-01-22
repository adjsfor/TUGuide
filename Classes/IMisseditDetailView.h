//
//  iMisseditDetailView.h
//  TUGuide
//
//  Created by Martin Langeder on 19.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IMisseditDetailView : UIView {
	UIImageView *logo;
	UILabel *header;
	UITableView *contentTable;
}

@property (nonatomic, retain) UITableView *contentTable;

- (id)initWithFrame:(CGRect)frame;

@end
