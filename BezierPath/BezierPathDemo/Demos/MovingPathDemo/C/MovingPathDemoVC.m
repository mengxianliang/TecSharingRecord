//
//  MovingPathDemoVC.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "MovingPathDemoVC.h"
#import "XLBallLoading.h"

@interface MovingPathDemoVC ()

@end

@implementation MovingPathDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"隐藏" style:UIBarButtonItemStylePlain target:self action:@selector(hide)];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"显示" style:UIBarButtonItemStylePlain target:self action:@selector(show)];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
}


-(void)show{
    //显示BallLoading
    [XLBallLoading showInView:self.view];
}

-(void)hide{
    //隐藏BallLoading
    [XLBallLoading hideInView:self.view];
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
