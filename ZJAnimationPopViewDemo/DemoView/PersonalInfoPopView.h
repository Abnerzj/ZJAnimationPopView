//
//  PersonalInfoPopView.h
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/16.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PersonalInfoTypeDouYu = 1, // 斗鱼
    PersonalInfoTypeYY,        // YY
    PersonalInfoTypeYingKe,    // 映客
} PersonalInfoType;

@interface PersonalInfoPopView : UIView

@property (nonatomic, copy) void(^closeActionBlock)();

+ (instancetype)xibWithPersonalInfoType:(PersonalInfoType)type;

@end
