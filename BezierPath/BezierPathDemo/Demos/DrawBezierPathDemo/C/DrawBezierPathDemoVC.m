//
//  DrawBezierPathDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "DrawBezierPathDemoVC.h"
#import "XLPoint.h"
#import "XLLine.h"

@interface DrawBezierPathDemoVC ()

//开始点
@property (nonatomic, strong) XLPoint *startPoint;

//结束点
@property (nonatomic, strong) XLPoint *endPoint;

//控制点集合
@property (nonatomic, strong) NSMutableArray <XLPoint *>*controlPoints;

//测试线条集合
@property (nonatomic, strong) NSMutableArray <XLLine *>*testLineArr;

//真实贝塞尔曲线
@property (nonatomic, strong) XLLine *bezierLine;

//绘制进度
@property (nonatomic, assign) CGFloat progress;

//进度控制
@property (nonatomic, strong) UISlider *slider;

@property (nonatomic, strong) UILabel *progressLabel;

@property (nonatomic, strong) UIButton *clearButton;

@end

@implementation DrawBezierPathDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.controlPoints = [[NSMutableArray alloc] init];
    self.testLineArr = [[NSMutableArray alloc] init];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    [self.view addGestureRecognizer:tap];
    
    self.progress = 0.0f;
    
    CGFloat viewCenterY = self.view.bounds.size.height - 100;
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 0, 300, 35)];
    self.slider.center = CGPointMake(self.slider.center.x, viewCenterY);
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
    
    self.progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.slider.frame) + 50, 0, 100, 35)];
    self.progressLabel.center = CGPointMake(self.progressLabel.center.x, viewCenterY);
    self.progressLabel.font = [UIFont boldSystemFontOfSize:30];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.text = @"t:0.00";
    [self.view addSubview:self.progressLabel];
    
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.progressLabel.frame) + 50, 0, 70, 35)];
    self.clearButton.center = CGPointMake(self.clearButton.center.x, viewCenterY);
    self.clearButton.backgroundColor = [UIColor blackColor];
    [self.clearButton setTitle:@"重置" forState:UIControlStateNormal];
    self.clearButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.clearButton addTarget:self action:@selector(clearMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.clearButton];
    
}

- (void)tapMethod:(UITapGestureRecognizer *)tap {
    
    //最多添加两个控制点
    if (self.controlPoints.count >= 2) {return;}
    
    CGPoint location = [tap locationInView:self.view];
    if (!self.startPoint) {
        self.startPoint = [self addTestPoint:location];
        self.startPoint.type = PointTypeStart;
    }else if (!self.endPoint) {
        self.endPoint = [self addTestPoint:location];
        self.endPoint.type = PointTypeEnd;
    }else {
        XLPoint *controlPoint = [self addTestPoint:location];
        controlPoint.type = PointTypeControl;
        [self.controlPoints addObject:controlPoint];
        [self updateTestLine];
    }
}

- (void)updateTestLine {
    
    //先移除所有辅助线
    [self clearTestLines];

    //添加链接起点、终点、控制点的辅助线(1级辅助线)
    for (NSInteger i = 0; i < self.controlPoints.count; i++) {
        XLPoint *point = self.controlPoints[i];
        //第一个控制点和起点的连线
        if (i == 0) {
            XLLine *line = [self addTestLineFromPoint:self.startPoint toPoint:point];
            line.level = 0;
            [self.testLineArr addObject:line];
        }
        //最后一个控制点和终点的连线
        if (i == self.controlPoints.count - 1) {
            XLLine *line = [self addTestLineFromPoint:point toPoint:self.endPoint];
            line.level = 0;
            [self.testLineArr addObject:line];
        }
        //每个控制点间的连线
        NSInteger nextIndex = i + 1;
        if (nextIndex < self.controlPoints.count) {
            XLPoint *nextPoint = self.controlPoints[nextIndex];
            XLLine *line = [self addTestLineFromPoint:point toPoint:nextPoint];
            line.level = 0;
            [self.testLineArr addObject:line];
        }
    }
    
    //下一级辅助线，层级数=控制点的数量
    NSInteger subLevel = self.controlPoints.count;
    for (NSInteger level = 0; level < subLevel; level++) {
        NSMutableArray *currentLevelLineArr = [[NSMutableArray alloc] init];
        //获取上一级的移动点
        for (NSInteger i = 0; i < self.testLineArr.count; i++) {
            XLLine *line = self.testLineArr[i];
            if (line.level == level) {
                [currentLevelLineArr addObject:line];
            }
        }
        
        //添加控制点
        for (NSInteger i = 0; i < currentLevelLineArr.count; i++) {
            XLLine *line = currentLevelLineArr[i];
            NSInteger nextIndex = i + 1;
            if (nextIndex < currentLevelLineArr.count) {
                XLLine *nextLine = currentLevelLineArr[nextIndex];
                XLLine *newLine = [self addTestLineFromPoint:line.movePoint toPoint:nextLine.movePoint];
                newLine.level = level + 1;
                [self.testLineArr addObject:newLine];
            }
        }
    }
    
    //把所有的一级连接线置顶,所有的点置顶
    for (XLLine *line in self.testLineArr) {
        
        [line.startPoint.layer removeFromSuperlayer];
        [self.view.layer addSublayer:line.startPoint.layer];
        
        [line.endPoint.layer removeFromSuperlayer];
        [self.view.layer addSublayer:line.endPoint.layer];
        
        [line.movePoint.layer removeFromSuperlayer];
        [self.view.layer addSublayer:line.movePoint.layer];
        
        if (line.level == 0) {
            [line.layer removeFromSuperlayer];
            [self.view.layer addSublayer:line.layer];
        }
    }
    
    for (XLPoint *point in self.controlPoints) {
        [point.layer removeFromSuperlayer];
        [self.view.layer addSublayer:point.layer];
    }
    
    [self.startPoint.layer removeFromSuperlayer];
    [self.view.layer addSublayer:self.startPoint.layer];
    self.startPoint.layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.endPoint.layer removeFromSuperlayer];
    [self.view.layer addSublayer:self.endPoint.layer];
    self.endPoint.layer.backgroundColor = [UIColor redColor].CGColor;
    
    //添加真实的贝塞尔曲线
    self.bezierLine = [self addBezierLineFromPoint:self.startPoint toPoint:self.endPoint controlPoints:self.controlPoints];
    self.bezierLine.layer.strokeEnd = self.progress;
    
    //更新进度label
    self.progressLabel.text = [NSString stringWithFormat:@"t:%.2f",self.progress];
}

- (void)clearTestLines {
    for (XLLine *line in self.testLineArr) {
        [line.layer removeFromSuperlayer];
        [line.movePoint.layer removeFromSuperlayer];
    }
    [self.testLineArr removeAllObjects];
    
    [self.bezierLine.layer removeFromSuperlayer];
}

- (void)clearMethod {
    [self clearTestLines];
    self.slider.value = 0;
    self.progress = 0.0f;
    self.progressLabel.text = @"t:0.00";
    for (XLPoint *point in self.controlPoints) {
        [point.layer removeFromSuperlayer];
    }
    [self.controlPoints removeAllObjects];
    
    [self.startPoint.layer removeFromSuperlayer];
    [self.endPoint.layer removeFromSuperlayer];
    self.startPoint = nil;
    self.endPoint = nil;
}

- (XLPoint *)addTestPoint:(CGPoint)point{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.bounds = CGRectMake(0, 0, 20, 20);
    layer.cornerRadius = 10;
    layer.position = point;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    XLPoint *testPoint = [[XLPoint alloc] init];
    testPoint.point = point;
    testPoint.layer = layer;
    
    return testPoint;
}

- (XLLine *)addTestLineFromPoint:(XLPoint *)fromPoint toPoint:(XLPoint *)toPoint {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint.point];
    [path addLineToPoint:toPoint.point];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 3.0f;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
    
    XLLine *line = [[XLLine alloc] init];
    line.startPoint = fromPoint;
    line.endPoint = toPoint;
    line.layer = layer;
    line.path = path;
    
    CGFloat movePointX = fromPoint.point.x + (toPoint.point.x - fromPoint.point.x)*self.progress;
    CGFloat movePointY = fromPoint.point.y + (toPoint.point.y - fromPoint.point.y)*self.progress;
    XLPoint *movePoint = [self addTestPoint:CGPointMake(movePointX, movePointY)];
    movePoint.type = PointTypeMove;
    line.movePoint = movePoint;
    return line;
}

- (XLLine *)addBezierLineFromPoint:(XLPoint *)fromPoint toPoint:(XLPoint *)toPoint controlPoints:(NSArray <XLPoint *>*)controlPoints {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:fromPoint.point];
    if (controlPoints.count == 1) {
        XLPoint *controlPoint = controlPoints.firstObject;
        [path addQuadCurveToPoint:toPoint.point controlPoint:controlPoint.point];
    }
    if (controlPoints.count == 2) {
        XLPoint *controlPoint1 = controlPoints.firstObject;
        XLPoint *controlPoint2 = controlPoints.lastObject;
        [path addCurveToPoint:toPoint.point controlPoint1:controlPoint1.point controlPoint2:controlPoint2.point];
    }
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 7.0f;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
    
    XLLine *line = [[XLLine alloc] init];
    line.startPoint = fromPoint;
    line.endPoint = toPoint;
    line.layer = layer;
    line.path = path;
    
    return line;
}

- (void)sliderValueChanged:(UISlider *)slider {
    self.progress = slider.value;
    [self updateTestLine];
}

@end
