//
//  SpriteButton.h
//  SpriteButton
//
//  Created by mzyw on 16/11/18.
//  Copyright © 2016年 mzyw. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SpriteButton;
@protocol SpriteButtonDelegate <NSObject>

- (void)didClickSpriteButton:(SpriteButton *)spriteBtn;

@end




@interface SpriteButton : UIButton

// 代理
@property (nonatomic, weak) id<SpriteButtonDelegate> delegate;

@end
