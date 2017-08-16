//
//  PersonalInfoPopView.m
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/16.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "PersonalInfoPopView.h"

static PersonalInfoType personalInfoType = PersonalInfoTypeDouYu;
@interface PersonalInfoPopView ()

@property (weak, nonatomic) IBOutlet UIImageView *personalInfoImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *personalInfoImageViewWCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *personalInfoImageViewHCons;

@end

@implementation PersonalInfoPopView

+ (instancetype)xibWithPersonalInfoType:(PersonalInfoType)type
{
    personalInfoType = type;
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.personalInfoImageView.layer.cornerRadius = 6.0f;
    self.personalInfoImageView.layer.masksToBounds = YES;
    
    NSString *imageName = [NSString stringWithFormat:@"personal_info_%02lu", (unsigned long)personalInfoType];
    UIImage *image = [UIImage imageNamed:imageName];
    self.personalInfoImageView.image = image;
    
    self.personalInfoImageViewWCons.constant = image.size.width*0.5;
    self.personalInfoImageViewHCons.constant = image.size.height*0.5;
    
    CGRect selfFrame = self.frame;
    selfFrame.size = CGSizeMake(self.personalInfoImageViewWCons.constant, self.personalInfoImageViewHCons.constant);
    self.frame = selfFrame;
    
    UIButton *normalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat margin = (personalInfoType == PersonalInfoTypeDouYu) ? 20.0f : ((personalInfoType == PersonalInfoTypeYingKe) ? 10.0f : 0.0f);
    CGFloat btnWH = 30.0f;
    normalBtn.frame = CGRectMake(self.personalInfoImageViewWCons.constant - margin - btnWH, margin, btnWH, btnWH);
    [normalBtn setBackgroundColor:[UIColor clearColor]];
    [normalBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.personalInfoImageView addSubview:normalBtn];
}

- (void)closeAction
{
    if (self.closeActionBlock) {
        self.closeActionBlock();
    }
}

@end
