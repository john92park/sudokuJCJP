//
//  CPViewController.m
//  sudoku
//
//  Created by Jun Hong Park on 9/16/14.
//  Copyright (c) 2014 Choi Park. All rights reserved.
//

#import "CPViewController.h"
#import "CPGridView.h"

int initialGrid[9][9]=
{
    {7,0,0,4,2,0,0,0,9},
    {0,0,9,5,0,0,0,0,4},
    {0,2,0,6,9,0,5,0,0},
    {6,5,0,0,0,0,4,3,0},
    {0,8,0,0,0,6,0,0,7},
    {0,1,0,0,4,5,6,0,0},
    {0,0,0,8,6,0,0,0,2},
    {3,4,0,9,0,0,1,0,0},
    {8,0,0,3,0,2,7,4,0}
};

@interface CPViewController () {
    CPGridView* _gridView;
}

@end

@implementation CPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // create grid frame
    CGRect frame = self.view.frame;
    CGFloat x = CGRectGetWidth(frame)*.1;
    CGFloat y = CGRectGetHeight(frame)*.1;
    CGFloat size = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))*.80;
    
    CGRect gridFrame = CGRectMake(x, y, size, size);
    
    // create grid view
    _gridView = [[CPGridView alloc] initWithFrame:gridFrame];
    _gridView.backgroundColor = [UIColor blackColor];
    
    // loop to set every button to have its corresponding value according to initialGrid
    for (int i = 0; i < 9 ; i++) {
        for (int j = 0; j < 9; j++) {
            [_gridView setButtonValueRow:i Column:j Value:initialGrid[i][j]];
        }
    }
    
    
    [self.view addSubview:_gridView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end