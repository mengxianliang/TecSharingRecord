//
//  QQUnreadMessageDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "QQUnreadMessageDemoVC.h"
#import "XLPanGestureGecognizer.h"

@interface QQUnreadMessageDemoVC ()

@end

@implementation QQUnreadMessageDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 300, 100, 100)];
    numberLabel.center = CGPointMake(self.view.bounds.size.width/2.0f, numberLabel.center.y);
    numberLabel.layer.cornerRadius = numberLabel.bounds.size.width/2.0f;
    numberLabel.layer.masksToBounds = YES;
    numberLabel.text = @"8";
    numberLabel.font = [UIFont systemFontOfSize:60];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.textColor = [UIColor whiteColor];
    numberLabel.userInteractionEnabled = YES;
    numberLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:numberLabel];
    XLPanGestureGecognizer *pan = [[XLPanGestureGecognizer alloc] init];
    [numberLabel addGestureRecognizer:pan];
    
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numberLabel.frame) + 200, 100, 100)];
    label2.center = CGPointMake(self.view.bounds.size.width/2.0f, label2.center.y);
    label2.text = @"99";
    label2.font = [UIFont systemFontOfSize:60];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor whiteColor];
    label2.userInteractionEnabled = YES;
    label2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label2];
    XLPanGestureGecognizer *pan2 = [[XLPanGestureGecognizer alloc] init];
    [label2 addGestureRecognizer:pan2];
    
    
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
