//
//  ZJXibFoctory.m
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/15.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "ZJXibFoctory.h"

@implementation ZJXibFoctory

+ (instancetype)xib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}

@end
