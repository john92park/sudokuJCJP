//
//  CPGridView.m
//  sudoku
//
//  Created by Jun Hong Park on 9/16/14.
//  Copyright (c) 2014 Choi Park. All rights reserved.
//

#import "CPGridView.h"



@implementation CPGridView

NSMutableArray* _buttonArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect frame = self.frame;
        _buttonArray = [[NSMutableArray alloc] init];
        
        // loop to create array of buttons
        for (int i=0; i<81; i++) {
            int row = i / 9;
            int col = i % 9;
            // some arithmetic for appropriately positioning the buttons
            CGFloat y = CGRectGetWidth(frame)*.1*row;
            CGFloat x = CGRectGetHeight(frame)*.1*col;
            CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.1;
            CGFloat colGap = CGRectGetWidth(frame) * 0.0077 * (col + 1);
            CGFloat rowGap = CGRectGetWidth(frame) * 0.0077 * (row + 1);
            if (col > 2) {
                colGap += CGRectGetWidth(frame) * 0.01;
            }
            if (col > 5) {
                colGap += CGRectGetWidth(frame) * 0.01;
            }
            if (row > 2) {
                rowGap += CGRectGetWidth(frame) * 0.01;
            }
            if (row > 5) {
                rowGap += CGRectGetWidth(frame) * 0.01;
            }
            
            // creation of a button
            CGRect buttonFrame = CGRectMake(colGap + x,rowGap + y,size,size);
            UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
            button.backgroundColor = [UIColor whiteColor];
            [self addSubview:button];
            
            button.tag = i;
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
            [_buttonArray addObject:button];
        }
    }
    return self;
}

// helper method to set a button to have a certain value
-(void)setButtonValueRow:(int)row Column:(int)col Value:(int)value
{
    UIButton* currentButton = _buttonArray[col*9 + row];
    NSString* position = [[NSString alloc] initWithFormat:@"%d",value];
    if (value != 0) {
        [currentButton setTitle:position forState:UIControlStateNormal];
        [currentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

// how the button behaves upon pressing
- (void)buttonPressed:(id)sender
{
    NSInteger tag = [sender tag];
    int row = tag / 9 + 1;
    int col = tag % 9 + 1;
    NSString* rowS = [[NSString alloc] initWithFormat:@"%d",row];
    NSString* colS = [[NSString alloc] initWithFormat:@"%d",col];
    
    // console message upon button press
    NSMutableString* message = [[NSMutableString alloc] init];
    [message appendString:@"Row: "];
    [message appendString:rowS];
    [message appendString:@" "];
    [message appendString:@"Column: "];
    [message appendString:colS];
    
    NSLog(message);
    
    // unhighlight all currently highlighted buttons and then highlight pressed button
    [self unhighlightAll];
    [(id)sender setBackgroundColor:[UIColor grayColor]];
}

// helper method to unhighlight all currently highlighted buttons
-(void)unhighlightAll
{
    for (int i = 0; i < 81; i++) {
        UIButton *button = _buttonArray[i];
        [button setBackgroundColor:[UIColor whiteColor]];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end