//
//  ViewTransitionDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "ViewTransitionDemoVC.h"
#import "ViewControllerB.h"
#import "XLBubbleTransition.h"

@interface ViewTransitionDemoVC ()

@end

@implementation ViewTransitionDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"ViewController A";
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"ViewController A";
    label.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    button.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMaxY(self.view.frame) - 60);
    [button setTitle:@"Go" forState:UIControlStateNormal];
    button.layer.cornerRadius = 25.0f;
    button.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
    [button addTarget:self action:@selector(pushMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pushMethod:(UIButton *)button {
    //设置push&pop动画
    self.xl_pushTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    self.xl_popTranstion = [XLBubbleTransition transitionWithAnchorRect:button.frame];
    
    ViewControllerB *vcB = [[ViewControllerB alloc] init];
    [self.navigationController pushViewController:vcB animated:true];
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
