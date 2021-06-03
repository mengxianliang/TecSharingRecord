//
//  TieBaLoadingDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "TieBaLoadingDemoVC.h"
#import "XLTieBarLoading.h"

@interface TieBaLoadingDemoVC ()

@end

@implementation TieBaLoadingDemoVC

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [XLTieBarLoading showInView:self.view];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [XLTieBarLoading hideInView:self.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
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
