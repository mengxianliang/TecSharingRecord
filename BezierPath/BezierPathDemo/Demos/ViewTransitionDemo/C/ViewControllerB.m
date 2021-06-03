//
//  ViewControllerB.m
//  BezierPathDemo
//
//  Created by mxl on 2020/12/24.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewController B";
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"ViewController B";
    label.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor colorWithRed:189/255.0 green:79/255.0 blue:70/255.0 alpha:1];
}

@end
