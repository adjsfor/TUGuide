//
//  CustomPickerDataSource.h
//  TUGuide
//
//  Created by Ivo Galic on 1/12/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

{
	
    NSArray *customPickerArray;
	
}



@property (nonatomic, retain) NSArray *customPickerArray;



@end