//
//  YKMarkAnimationView.m
//  SimpleFinance
//
//  Created by zhaojijin on 2016/8/19.
//  Copyright © 2016年 yinker. All rights reserved.
//

#import "YKMarkAnimationView.h"

@interface YKMarkAnimationView ()

@property (nonatomic, strong) CAShapeLayer *markLayer;
@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation YKMarkAnimationView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self drawMarkView];
    }
    return self;
}

- (void)drawMarkView {
    [self drawMarkLayer];
    [self addMarkAnimation];
}

- (void)drawMarkLayer {
    self.markLayer = [CAShapeLayer layer];
    self.markLayer.path = [self drawMarkPath];
    self.markLayer.fillColor = [UIColor clearColor].CGColor;
    self.markLayer.frame = self.bounds;
    [self.layer addSublayer:self.markLayer];
}

- (void)setMarkLineWidth:(CGFloat)markLineWidth {
    _markLineWidth = markLineWidth;
    self.markLayer.lineWidth = markLineWidth;
}

- (void)setCircleLineWidth:(CGFloat)circleLineWidth {
    _circleLineWidth = circleLineWidth;
    self.circleLayer.lineWidth = circleLineWidth;
}

- (void)setMarkColor:(UIColor *)markColor {
    _markColor = markColor;
    self.markLayer.strokeColor = markColor.CGColor;
    self.circleLayer.strokeColor = markColor.CGColor;
}

- (void)setShowBorderCircle:(BOOL)showBorderCircle {
    _showBorderCircle = showBorderCircle;
    if (showBorderCircle) {
        [self drawCircleLayer];
        [self addCircleAnimation];
    }
}

- (CGPathRef)drawMarkPath {
    UIBezierPath * markPath = [UIBezierPath bezierPath];
    [markPath moveToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.27083 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.54167 * CGRectGetHeight(self.bounds))];
    [markPath addLineToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.41667 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.68750 * CGRectGetHeight(self.bounds))];
    [markPath addLineToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.75000 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.35417 * CGRectGetHeight(self.bounds))];
    markPath.lineCapStyle = kCGLineCapSquare;
    return markPath.CGPath;
}

- (void)drawCircleLayer {
    self.circleLayer = [CAShapeLayer layer];
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:self.bounds.size.width/2 startAngle:-M_PI endAngle:M_PI clockwise:YES];

    self.circleLayer.path = circlePath.CGPath;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.frame = self.bounds;
    self.circleLayer.lineWidth = _circleLineWidth;
    self.circleLayer.strokeColor = _markColor.CGColor;
    [self.layer addSublayer:self.circleLayer];
}

- (void)addCircleAnimation {
    CABasicAnimation * animation = [self getBasicAnimation];
    [self.circleLayer addAnimation:animation forKey:@"circleAnimation"];
}

- (CABasicAnimation *)getBasicAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration  = 0.6;
    animation.fromValue = @0;
    animation.toValue   = @1;
    return animation;
}

- (void)addMarkAnimation {
    CABasicAnimation *animation = [self getBasicAnimation];
    [self.markLayer addAnimation:animation forKey:@"markAnimation"];
}

@end
