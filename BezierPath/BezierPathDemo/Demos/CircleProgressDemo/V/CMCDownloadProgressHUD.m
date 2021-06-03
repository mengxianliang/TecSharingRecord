//
//  CMCDownloadProgressHUD.m
//  YNStudentSideOnLine
//
//  Created by mxl on 2020/7/3.
//  Copyright © 2020 XDF. All rights reserved.
//

#import "CMCDownloadProgressHUD.h"

@interface CMCDownloadProgressHUD ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) CAShapeLayer* progressLayer;

@property (nonatomic, strong) UILabel* progressLabel;

@property (nonatomic, strong) UILabel* textLabel;

@end

@implementation CMCDownloadProgressHUD

- (instancetype)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    self.contentView = [[UIView alloc] init];
    self.contentView.bounds = CGRectMake(0, 0, 280, 240);
    self.contentView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.contentView.layer.cornerRadius = 10.0f;
    self.contentView.layer.masksToBounds = YES;
    [self addSubview:self.contentView];
    
    CGFloat progressWidth = 180.0f;
    CGRect progressRect = CGRectMake((self.contentView.bounds.size.width - progressWidth)/2.0f, 32, progressWidth, progressWidth);
    
    //创建贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(progressRect), CGRectGetMidY(progressRect)) radius:progressWidth/2.0 startAngle:(-0.5f*M_PI) endAngle:1.5f*M_PI clockwise:YES];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    self.progressLayer = layer;
    layer.frame = self.contentView.bounds;
    layer.fillColor =  [[UIColor clearColor] CGColor];
    layer.strokeColor  = [[UIColor whiteColor] CGColor];
    layer.lineCap = kCALineCapRound;
    layer.lineWidth = 10;
    layer.path = [path CGPath];
    layer.strokeEnd = 0;
    [self.contentView.layer addSublayer:layer];
    
    self.progressLabel = [[UILabel alloc] init];
    self.progressLabel.frame = progressRect;
    self.progressLabel.textColor = [UIColor whiteColor];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.font = [UIFont systemFontOfSize:50];
    self.progressLabel.text = @"0%";
    [self.contentView addSubview:self.progressLabel];
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.frame = CGRectMake(0, 360 - 65, 420, 26);
    self.textLabel.textColor = [UIColor whiteColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont systemFontOfSize:30];
    [self.contentView addSubview:self.textLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentView.center = CGPointMake(self.bounds.size.width/2.0f, self.bounds.size.height/2.0f);
}

+ (CMCDownloadProgressHUD *)showInView:(UIView *)superView {
    CMCDownloadProgressHUD *hud = [[CMCDownloadProgressHUD alloc] init];
    hud.frame = superView.bounds;
    [superView addSubview:hud];
    return hud;
}

- (void)setProgress:(float)progress {
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
    self.progressLayer.strokeEnd = progress;
}

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
}

- (void)hide {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//设置返回区域可点击
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (CGRectContainsPoint(CGRectMake(0, 0, 60, 60), point)) {
        self.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.userInteractionEnabled = YES;
        });
    }
    return view;
}

@end
