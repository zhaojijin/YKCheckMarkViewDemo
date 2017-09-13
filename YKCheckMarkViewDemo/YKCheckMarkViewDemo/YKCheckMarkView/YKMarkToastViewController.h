//
//  YKMarkToastViewController.h
//  SimpleFinance
//
//  Created by zhaojijin on 2016/8/19.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKMarkAnimationView.h"

typedef void(^YKAnimationFinishedBlock)();

@interface YKMarkToastViewController : UIViewController

@property (nonatomic, strong) NSString *message;
@property (nonatomic, copy) YKAnimationFinishedBlock  finishedBlock;

@property (nonatomic, assign) BOOL isSuccess;

- (void)showInViewController:(UIViewController *)viewController;

@end
