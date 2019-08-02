//
//  LineFromBottomView.m
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2019/8/2.
//  Copyright © 2019年 Abnerzj. All rights reserved.
//

#import "LineFromBottomView.h"

@interface LineFromBottomView ()

@end

@implementation LineFromBottomView

- (IBAction)doneAction:(id)sender
{
    if (self.doneActionBlock) {
        self.doneActionBlock();
    }
}

@end
