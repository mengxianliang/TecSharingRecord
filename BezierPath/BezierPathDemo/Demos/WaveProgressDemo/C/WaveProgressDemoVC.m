//
//  WaveProgressDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "WaveProgressDemoVC.h"
#import "XLWaveProgress.h"

@interface WaveProgressDemoVC ()

@property (nonatomic, strong) XLWaveProgress *waveProgress;

@end

@implementation WaveProgressDemoVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.waveProgress start];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //开始波浪
    [self.waveProgress stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //波浪的背景，可以不要
    UIView *waveContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    waveContainer.backgroundColor = [UIColor colorWithRed:190/255.0f green:232/255.0f blue:231/255.0f alpha:0.8];
    waveContainer.layer.cornerRadius = waveContainer.bounds.size.width/2.0f;
    waveContainer.layer.masksToBounds = true;
    waveContainer.center = self.view.center;
    [self.view addSubview:waveContainer];
    
    
    //初始化波浪，需要设置字体大小、字体颜色、波浪背景颜色、前层波浪颜色、后层博浪颜色
    self.waveProgress = [[XLWaveProgress alloc] initWithFrame:CGRectMake(0, 0, 160, 160)];
    self.waveProgress.center = CGPointMake(waveContainer.bounds.size.width/2.0f, waveContainer.bounds.size.height/2.0f);
    self.waveProgress.progress = 0.0f;
    //波浪背景颜色，深绿色
    self.waveProgress.waveBackgroundColor = [UIColor colorWithRed:96/255.0f green:159/255.0f blue:150/255.0f alpha:1];
    //前层波浪颜色
    self.waveProgress.backWaveColor = [UIColor colorWithRed:136/255.0f green:199/255.0f blue:190/255.0f alpha:1];
    //后层波浪颜色
    self.waveProgress.frontWaveColor = [UIColor colorWithRed:28/255.0 green:203/255.0 blue:174/255.0 alpha:1];
    //字体
    self.waveProgress.textFont = [UIFont boldSystemFontOfSize:50];
    //文字颜色
    self.waveProgress.textColor = [UIColor whiteColor];
    [waveContainer addSubview:self.waveProgress];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 300)/2.0f, CGRectGetMaxY(waveContainer.frame) + 50, 300, 30)];
    [slider addTarget:self action:@selector(sliderMethod:) forControlEvents:UIControlEventValueChanged];
    [slider setMaximumValue:1];
    [slider setMinimumValue:0];
    [slider setMinimumTrackTintColor:[UIColor colorWithRed:96/255.0f green:159/255.0f blue:150/255.0f alpha:1]];
    [self.view addSubview:slider];
}

- (void)sliderMethod:(UISlider*)slider {
    self.waveProgress.progress = slider.value;
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
