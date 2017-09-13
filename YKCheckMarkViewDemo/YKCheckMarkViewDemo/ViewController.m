//
//  ViewController.m
//  YKCheckMarkViewDemo
//
//  Created by zhaojijin on 2016/12/6.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import "ViewController.h"
#import "YKMarkToastViewMgr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sucessAction:(id)sender {
    [YKMarkToastViewMgr showMarkToastInViewController:self message:@"设置成功，开启新生活" completionBlock:^{
        
    }];
}

- (IBAction)failedAction:(id)sender {
    [YKMarkToastViewMgr showFailedToastInViewController:self message:@"加载失败，请稍候再试！" completionBlock:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
