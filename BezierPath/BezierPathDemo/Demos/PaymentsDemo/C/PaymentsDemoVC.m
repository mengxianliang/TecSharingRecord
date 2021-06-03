//
//  PaymentsDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "PaymentsDemoVC.h"
#import "XLPaymentLoadingHUD.h"
#import "XLPaymentSuccessHUD.h"

@interface PaymentsDemoVC ()

@end

@implementation PaymentsDemoVC

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [XLPaymentLoadingHUD hideIn:self.view];
    [XLPaymentSuccessHUD hideIn:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"支付完成" style:UIBarButtonItemStylePlain target:self action:@selector(showSuccessAnimation)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"开始支付" style:UIBarButtonItemStylePlain target:self action:@selector(showLoadingAnimation)];
    
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
}


-(void)showLoadingAnimation{
    
    self.title = @"正在付款...";
    
    //隐藏支付完成动画
    [XLPaymentSuccessHUD hideIn:self.view];
    //显示支付中动画
    [XLPaymentLoadingHUD showIn:self.view];
}

-(void)showSuccessAnimation{
    
    self.title = @"付款完成";
    
    //隐藏支付中成动画
    [XLPaymentLoadingHUD hideIn:self.view];
    //显示支付完成动画
    [XLPaymentSuccessHUD   showIn:self.view];
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
