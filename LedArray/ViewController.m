//
//  ViewController.m
//  LEDArray
//
//  Created by du phung cong on 8/4/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _rowMargin;
    CGFloat _columnMargin;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    _columnMargin = 40.0;
    _rowMargin = 40.0;
    [self drawBallMatrixWithRow:12 andColumn:10];
    
}

- (void) placeBallAtX: (CGFloat) x
                 andY: (CGFloat) y
              withTag: (int) tag {
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
    
    //NSLog(@"w = %3.0f, h = %3.0f", ball.bounds.size.width, ball.bounds.size.height);
}

- (CGFloat) spaceBetweenRow: (int) numberOfRow {
    if(numberOfRow == 1) {
        return 0.0;
    }
    else {
        return (self.view.bounds.size.height - 2 * _columnMargin) / (numberOfRow - 1);
    }
}

- (CGFloat) spaceBetweenColumn: (int) numberOfColumn {
    if(numberOfColumn == 1) {
        return 0.0;
    }
    else {
        return (self.view.bounds.size.width - 2 * _rowMargin) / (numberOfColumn - 1);
    }
}

- (void) drawBallMatrixWithRow: (int) numberOfRow andColumn: (int) numberOfColumn {
    if((numberOfColumn == 0) || (numberOfColumn == 0)) {
        return;
    }
    else {
        CGFloat spaceBetweenRow = [self spaceBetweenRow:numberOfRow];
        CGFloat spaceBetweenColumn = [self spaceBetweenColumn:numberOfColumn];
        int tag = 1;
        for(int i = 0; i < numberOfRow; i++) {
            for(int j = 0; j < numberOfColumn; j++) {
                [self placeBallAtX:_rowMargin + j * spaceBetweenColumn
                              andY:_columnMargin + i * spaceBetweenRow
                           withTag:tag];
                NSLog(@"tag %d", tag);
                tag++;
            }
        }

    }
}

@end
