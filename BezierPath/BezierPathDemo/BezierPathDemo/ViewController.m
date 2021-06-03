//
//  ViewController.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "ViewController.h"
#import "DrawBezierPathDemoVC.h"
#import "CircleProgressDemoVC.h"
#import "PaymentsDemoVC.h"
#import "MovingPathDemoVC.h"
#import "WaveProgressDemoVC.h"
#import "TieBaLoadingDemoVC.h"
#import "ViewTransitionDemoVC.h"
#import "QQUnreadMessageDemoVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Demos";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self demoTitles].count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId =  @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd、%@",indexPath.row + 1,[self demoTitles][indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Class vcClass = [self demoVCClasses][indexPath.row];
    UIViewController *vc = [[vcClass alloc] init];
    vc.title = [self demoTitles][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSArray *)demoTitles {
    return @[@"绘制贝塞尔曲线",@"圆环进度条",@"支付中效果",@"视图移动路径",@"绘制函数曲线",@"贴吧加载效果",@"视图转场动画",@"QQ未读消息"];
}

- (NSArray *)demoVCClasses {
    return @[DrawBezierPathDemoVC.class,CircleProgressDemoVC.class,PaymentsDemoVC.class,MovingPathDemoVC.class,WaveProgressDemoVC.class,TieBaLoadingDemoVC.class,ViewTransitionDemoVC.class,QQUnreadMessageDemoVC.class];
}

@end
