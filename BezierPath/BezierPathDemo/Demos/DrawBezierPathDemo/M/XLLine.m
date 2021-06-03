//
//  XLLine.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "XLLine.h"

@implementation XLLine

- (void)setLevel:(NSInteger)level {
    _level = level;
    CGColorRef color = [self colorOfLevel:level];
    self.layer.strokeColor = color;
    self.movePoint.layer.backgroundColor = color;
    self.startPoint.layer.backgroundColor = color;
    self.endPoint.layer.backgroundColor = color;
}

- (CGColorRef)colorOfLevel:(NSInteger)level {
    switch (level) {
        case 0:
            return [UIColor grayColor].CGColor;
            break;
        case 1:
            return [UIColor greenColor].CGColor;
            break;
        case 2:
            return [UIColor blueColor].CGColor;
            break;
        default:
            return [UIColor redColor].CGColor;
            break;
    }
}

@end
