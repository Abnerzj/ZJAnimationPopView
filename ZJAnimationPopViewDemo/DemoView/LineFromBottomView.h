//
//  LineFromBottomView.h
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2019/8/2.
//  Copyright © 2019年 Abnerzj. All rights reserved.
//

#import "ZJXibFoctory.h"

NS_ASSUME_NONNULL_BEGIN

@interface LineFromBottomView : ZJXibFoctory

@property (nonatomic, copy) void(^doneActionBlock)(void);

@end

NS_ASSUME_NONNULL_END
