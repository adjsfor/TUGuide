//
//  LocationDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 10.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "Classroom.h"


@interface LocationDetailViewController : UIViewController {
	
	Classroom *c;

}

@property (nonatomic, retain) Classroom *c;

-(id)initWithClassroom:(Classroom *)classr;

@end
