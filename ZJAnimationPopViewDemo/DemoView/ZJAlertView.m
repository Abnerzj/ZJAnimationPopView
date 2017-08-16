//
//  ZJAlertView.m
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/15.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "ZJAlertView.h"

@implementation ZJAlertView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
}

- (IBAction)canceSureAction:(UIButton *)sender
{
    if (self.canceSureActionBlock) {
        self.canceSureActionBlock(sender.tag);
    }
}

@end
