//
//  ViewController.m
//  SpriteButton
//
//  Created by mzyw on 16/11/18.
//  Copyright © 2016年 mzyw. All rights reserved.
//

#import "ViewController.h"
#import "SpriteButton.h"



@interface ViewController ()<SpriteButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SpriteButton *spriteBtn = [[SpriteButton alloc] init];
    spriteBtn.frame = CGRectMake(0, 90, 250, 50);
    [spriteBtn setImage:[UIImage imageNamed:@"plus_L"] forState:UIControlStateNormal];
    [spriteBtn setImage:[UIImage imageNamed:@"plus_F"] forState:UIControlStateSelected];
    spriteBtn.delegate = self;
    
    [self.view addSubview:spriteBtn];
}


- (void)didClickSpriteButton:(SpriteButton *)spriteBtn
{

//    NSLog(@"%@",NSStringFromCGRect(spriteBtn.frame));

}

@end
