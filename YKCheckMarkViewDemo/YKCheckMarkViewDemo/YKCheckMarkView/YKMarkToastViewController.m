//
//  YKMarkToastViewController.m
//  SimpleFinance
//
//  Created by zhaojijin on 2016/8/19.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import "YKMarkToastViewController.h"

@interface YKMarkToastViewController ()

@property (nonatomic, strong) IBOutlet UILabel *messageLabel;
@property (nonatomic, strong) IBOutlet UIView *containView;
@property (nonatomic, strong) IBOutlet YKMarkAnimationView *markView;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *markViewTopConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *messageLabelBottomConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *messageLabelTopConstraint;

@property (nonatomic, strong) NSMutableAttributedString * messageMutableAttributeString;

@end

@implementation YKMarkToastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containView.transform = CGAffineTransformMakeScale(0, 0);
    [self configUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self handleShowAnimationEvent];
}

- (NSMutableAttributedString *)messageMutableAttributeString {
    if (nil == _messageMutableAttributeString) {
        _messageMutableAttributeString = [[NSMutableAttributedString alloc] init];
    }
    return _messageMutableAttributeString;
}

- (void)configUI {
    self.containView.layer.masksToBounds = YES;
    self.containView.layer.cornerRadius = 7;
    self.containView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.messageMutableAttributeString.mutableString.string = @"";
    if (self.message.length > 0) {
        NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 4;
        style.alignment = NSTextAlignmentCenter;
        self.messageMutableAttributeString.mutableString.string = self.message;
        NSRange range = NSMakeRange(0, self.message.length);
        if (range.location != NSNotFound) {
            [self.messageMutableAttributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range];
            [self.messageMutableAttributeString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range];
            [self.messageMutableAttributeString addAttribute:NSParagraphStyleAttributeName value:style range:range];
            self.messageLabel.attributedText = self.messageMutableAttributeString;
        }
    } else {
        self.messageLabel.text = self.message;
    }
    
    if (self.isSuccess) {
        self.markView.markColor = [UIColor greenColor];
        self.markView.showBorderCircle = YES;
        self.markView.markLineWidth = 2;
        self.markView.circleLineWidth = 1;
        self.markView.hidden = NO;
        self.imageView.hidden = YES;
    } else {
        self.markView.hidden = YES;
        self.imageView.hidden = NO;
    }
    CGFloat uiScale = [UIScreen mainScreen].bounds.size.width/375.0;
    self.markViewTopConstraint.constant = 15 * uiScale;
    self.messageLabelTopConstraint.constant = 15 * uiScale;
    self.messageLabelBottomConstraint.constant = 20 * uiScale;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showInViewController:(UIViewController *)viewController {
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
    [self.view layoutIfNeeded];
    self.view.frame = viewController.view.frame;
    [self didMoveToParentViewController:viewController];
}

- (void)handleShowAnimationEvent {
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.containView.transform = CGAffineTransformMakeScale(1, 1);
    } completion:^(BOOL finished) {
        self.containView.transform = CGAffineTransformIdentity;
    }];
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
