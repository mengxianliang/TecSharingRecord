//
//  XLPoint.h
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//点类型
typedef NS_ENUM(NSInteger, PointType) {
    PointTypeStart = 0,
    PointTypeEnd = 1,
    PointTypeControl = 2,
    PointTypeMove = 3,
};

@interface XLPoint : NSObject

@property (nonatomic, assign) PointType type;

@property (nonatomic, assign) CGPoint point;

@property (nonatomic, strong) CAShapeLayer *layer;

@end

NS_ASSUME_NONNULL_END
