//
//  MensaView.h
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MensaView : UIView {
	
	UIButton *mensaBlue;
	UIButton *mensaRed;
	UIButton *mensaGreen;
	UIButton *mensaOrange;
}

@property (nonatomic, retain) UIButton *mensaBlue;
@property (nonatomic, retain) UIButton *mensaRed;
@property (nonatomic, retain) UIButton *mensaGreen;
@property (nonatomic, retain) UIButton *mensaOrange;


@end
