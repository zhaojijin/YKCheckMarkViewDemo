//
//  YKMarkToastViewMgr.m
//  SimpleFinance
//
//  Created by zhaojijin on 2016/9/7.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import "YKMarkToastViewMgr.h"

@interface YKMarkToastViewMgr ()

@property (nonatomic, strong) YKMarkToastViewController *toastViewController;

@end

static YKMarkToastViewMgr *markToastView = nil;

@implementation YKMarkToastViewMgr

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        markToastView = [[YKMarkToastViewMgr alloc] init];
    });
    return markToastView;
}

#pragma mark - successMarkToast

+ (void)showMarkToastInViewController:(UIViewController *)viewController message:(NSString *)message completionBlock:(YKAnimationFinishedBlock)complectionBlock {
    [self showToastInViewController:viewController message:message isSuccess:YES completionBlock:complectionBlock];
}

#pragma mark - failedToast

+ (void)showFailedToastInViewController:(UIViewController *)viewController message:(NSString *)message completionBlock:(YKAnimationFinishedBlock)complectionBlock {
    [self showToastInViewController:viewController message:message isSuccess:NO completionBlock: complectionBlock];
}

+ (void)showToastInViewController:(UIViewController *)viewController message:(NSString *)message isSuccess:(BOOL)isSuccess completionBlock:(YKAnimationFinishedBlock)complectionBlock {
    
    if ([YKMarkToastViewMgr sharedInstance].toastViewController) {
        [[YKMarkToastViewMgr sharedInstance].toastViewController removeFromParentViewController];
        [[YKMarkToastViewMgr sharedInstance].toastViewController.view removeFromSuperview];
        [YKMarkToastViewMgr sharedInstance].toastViewController = nil;
    }
    
    YKMarkToastViewController * toastViewController = [[YKMarkToastViewController alloc] initWithNibName:@"YKMarkToastViewController" bundle:nil];
    toastViewController.message = message;
    toastViewController.isSuccess = isSuccess;
    [YKMarkToastViewMgr sharedInstance].toastViewController = toastViewController;
    [self performSelector:@selector(remove:) withObject:complectionBlock afterDelay:1.5];
    [toastViewController showInViewController:viewController];
}

+ (void)remove:(YKAnimationFinishedBlock)finishedBlock {
    [UIView animateWithDuration:0.5 animations:^{
        [YKMarkToastViewMgr sharedInstance].toastViewController.view.alpha = 0;
    } completion:^(BOOL finished) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [[YKMarkToastViewMgr sharedInstance].toastViewController removeFromParentViewController];
        [[YKMarkToastViewMgr sharedInstance].toastViewController.view removeFromSuperview];
        [YKMarkToastViewMgr sharedInstance].toastViewController = nil;
        if (finishedBlock) {
            finishedBlock();
        }
    }];
}

@end
