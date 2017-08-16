//
//  SlideSelectCardView.h
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/16.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "ZJXibFoctory.h"

@interface SlideSelectCardView : ZJXibFoctory

@property (nonatomic, copy) void(^selectActionBlock)(NSUInteger currentPage);

- (void)updatePage:(NSUInteger)currentPage;
@end
