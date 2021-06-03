//
//  XLLine.h
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import <Foundation/Foundation.h>
#import "XLPoint.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLLine : NSObject

@property (nonatomic, strong) CAShapeLayer *layer;

@property (nonatomic, strong) UIBezierPath *path;

@property (nonatomic, strong) XLPoint *startPoint;

@property (nonatomic, strong) XLPoint *endPoint;

@property (nonatomic, strong) XLPoint *movePoint;

@property (nonatomic, assign) NSInteger level;

@end

NS_ASSUME_NONNULL_END
