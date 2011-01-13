//
//  CustomPickerDataSource.m
//  TUGuide
//
//  Created by Ivo Galic on 1/12/11.
//  Copyright 2011 Galic Design. All rights reserved.
//


#import "CustomPickerDataSource.h"

#import "CustomView.h"



@implementation CustomPickerDataSource



@synthesize customPickerArray;



- (id)init

{
	
    // use predetermined frame size
	
    self = [super init];
	
    if (self)
		
    {
		
        // create the data source for this custom picker
		
        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
		
		
		
        CustomView *earlyMorningView = [[CustomView alloc] initWithFrame:CGRectZero];
		
        earlyMorningView.title = @"Early Morning";
		
        earlyMorningView.image = [UIImage imageNamed:@"12-6AM.png"];
		
        [viewArray addObject:earlyMorningView];
		
        [earlyMorningView release];
		
		
		
        CustomView *lateMorningView = [[CustomView alloc] initWithFrame:CGRectZero];
		
        lateMorningView.title = @"Late Morning";
		
        lateMorningView.image = [UIImage imageNamed:@"6-12AM.png"];
		
        [viewArray addObject:lateMorningView];
		
        [lateMorningView release];
		
		
		
        CustomView *afternoonView = [[CustomView alloc] initWithFrame:CGRectZero];
		
        afternoonView.title = @"Afternoon";
		
        afternoonView.image = [UIImage imageNamed:@"12-6PM.png"];
		
        [viewArray addObject:afternoonView];
		
        [afternoonView release];
		
		
		
        CustomView *eveningView = [[CustomView alloc] initWithFrame:CGRectZero];
		
        eveningView.title = @"Evening";
		
        eveningView.image = [UIImage imageNamed:@"6-12PM.png"];
		
        [viewArray addObject:eveningView];
		
        [eveningView release];
		
		
		
        self.customPickerArray = viewArray;
		
        [viewArray release];
		
    }
	
    return self;
	
}



- (void)dealloc

{
	
    [customPickerArray release];
	
    [super dealloc];
	
}





#pragma mark -

#pragma mark UIPickerViewDataSource



- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component

{
	
    return [CustomView viewWidth];
	
}



- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component

{
	
    return [CustomView viewHeight];
	
}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
	
    return [customPickerArray count];
	
}



- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
	
    return 1;
	
}





#pragma mark -

#pragma mark UIPickerViewDelegate



// tell the picker which view to use for a given component and row, we have an array of views to show

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row

          forComponent:(NSInteger)component reusingView:(UIView *)view

{
	
    return [customPickerArray objectAtIndex:row];
	
}



@end