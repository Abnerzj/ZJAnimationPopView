//
//  ZJAlertView.h
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/15.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "ZJXibFoctory.h"

@interface ZJAlertView : ZJXibFoctory

@property (nonatomic, copy) void(^canceSureActionBlock)(BOOL isSure);

@end
