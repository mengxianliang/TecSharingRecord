//
//  CMCDownloadProgressHUD.h
//  YNStudentSideOnLine
//
//  Created by mxl on 2020/7/3.
//  Copyright © 2020 XDF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMCDownloadProgressHUD : UIView

@property (nonatomic, assign) float progress;

@property (nonatomic, strong) NSString *text;

+ (CMCDownloadProgressHUD *)showInView:(UIView *)superView;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
