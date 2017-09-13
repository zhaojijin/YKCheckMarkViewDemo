//
//  YKMarkToastViewMgr.h
//  SimpleFinance
//
//  Created by zhaojijin on 2016/9/7.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKMarkToastViewController.h"

@interface YKMarkToastViewMgr : NSObject

+ (instancetype)sharedInstance;

+ (void)showMarkToastInViewController:(UIViewController *)viewController message:(NSString *)message completionBlock:(YKAnimationFinishedBlock)complectionBlock;

+ (void)showFailedToastInViewController:(UIViewController *)viewController message:(NSString *)message completionBlock:(YKAnimationFinishedBlock)complectionBlock;

@end
