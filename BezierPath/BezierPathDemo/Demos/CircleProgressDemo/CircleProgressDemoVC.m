//
//  CircleProgressDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "CircleProgressDemoVC.h"
#import "CMCDownloadProgressHUD.h"

@interface CircleProgressDemoVC ()

@property (nonatomic, strong) CMCDownloadProgressHUD *progressHUD;

@property (nonatomic, strong) UISlider *slider;

@end

@implementation CircleProgressDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.progressHUD = [[CMCDownloadProgressHUD alloc] init];
    self.progressHUD.bounds = CGRectMake(0, 0, 100, 100);
    self.progressHUD.center = self.view.center;
    self.progressHUD.text = @"下载中...";
    self.progressHUD.progress = 0.0;
    [self.view addSubview:self.progressHUD];
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.progressHUD.frame), CGRectGetMaxY(self.progressHUD.frame) + 150, 300, 50)];
    self.slider.center = CGPointMake(self.view.center.x, self.slider.center.y);
    [self.slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.slider];
}

- (void)sliderValueChanged:(UISlider *)slider {
    self.progressHUD.progress = slider.value;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
