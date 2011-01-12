//
//  MensaDetailView.m
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaDetailView.h"


@implementation MensaDetailView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
