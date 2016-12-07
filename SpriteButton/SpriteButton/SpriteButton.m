//
//  SpriteButton.m
//  SpriteButton
//
//  Created by mzyw on 16/11/18.
//  Copyright © 2016年 mzyw. All rights reserved.
//

#import "SpriteButton.h"

@interface SpriteButton ()


@end



@implementation SpriteButton




- (instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(buttonPan:)]];
        [self addTarget:self action:@selector(didClickSpriteButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


#pragma mark----didClickSpriteButton 按钮点击
- (void)didClickSpriteButton
{
    
    self.selected = !self.selected;
    
    
    if (self.selected) {
        
        
        
        [self setTitle:@"切换账号" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }else{
        
        [self setTitle:@"" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    
    if ([_delegate respondsToSelector:@selector(didClickSpriteButton:)]) {
        
        [_delegate didClickSpriteButton:self];
    }

}

static CGFloat myEndX = 0;

#pragma mark----buttonPan 拖拽
- (void)buttonPan:(UIPanGestureRecognizer *)panGestureRecognizer
{

    CGPoint beginP = [panGestureRecognizer translationInView:self];
    
    self.transform = CGAffineTransformTranslate(self.transform, beginP.x, beginP.y);
    [panGestureRecognizer setTranslation:CGPointZero inView:self];

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded ||panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||panGestureRecognizer.state == UIGestureRecognizerStateFailed) {
        
        CGRect tmpFrame = self.frame;
        CGFloat endX = tmpFrame.origin.x - [UIScreen mainScreen].bounds.size.width *0.5;
        
        if (tmpFrame.origin.y < 20) {
            
            self.frame = CGRectMake(self.frame.origin.x, 20, self.frame.size.width, self.frame.size.height);
            
        }
        
        if (CGRectGetMaxY(self.frame) > [UIScreen mainScreen].bounds.size.height) {
            
            self.frame = CGRectMake(self.frame.origin.x, [UIScreen mainScreen].bounds.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }
        
        
        
        if (endX > 0) {
            
            myEndX = 1;
            [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.frame = CGRectOffset(self.frame, [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.frame), 0);
            } completion:nil];
        }else{
        
            myEndX = 0;
            [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                self.frame = CGRectOffset(self.frame, -tmpFrame.origin.x, 0);
            } completion:nil];
        
        }
        [self setNeedsLayout];
       
               
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (myEndX == 0) {
        self.imageView.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame), 0, self.frame.size.width - self.imageView.frame.size.width, self.frame.size.height);
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }else{
    
        self.imageView.frame = CGRectMake(self.frame.size.width - self.imageView.frame.size.width, 0, self.frame.size.height, self.frame.size.height);
        self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width - self.imageView.frame.size.width, self.frame.size.height);
        
        self.titleLabel.textAlignment = NSTextAlignmentRight;
    }

}

@end
