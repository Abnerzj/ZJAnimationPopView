//
//  SlideSelectCardView.m
//  ZJAnimationPopViewDemo
//
//  Created by abner on 2017/8/16.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "SlideSelectCardView.h"

#define kPageCount 3

@interface SlideSelectCardView ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation SlideSelectCardView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.contentScrollView.contentSize = CGSizeMake(self.contentScrollView.frame.size.width*kPageCount, self.contentScrollView.contentSize.height);
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.bounces = NO;
    self.contentScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.delegate = self;
    
    CGFloat contentScrollViewW = self.contentScrollView.frame.size.width;
    CGFloat contentScrollViewH = self.contentScrollView.frame.size.height;
    for(NSUInteger i = 0;i<kPageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"personal_info_%02lu", (unsigned long)i+1];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*contentScrollViewW, 0, contentScrollViewW, contentScrollViewH)];
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentScrollView addSubview:imageView];
    }
}

- (void)updatePage:(NSUInteger)currentPage
{
    self.pageControl.currentPage = currentPage;
    [self selectPage:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger currentPage = (NSUInteger)((scrollView.contentOffset.x+scrollView.frame.size.width/2.f)/scrollView.frame.size.width);

    if (self.pageControl.currentPage == currentPage) {
        return;
    }
    
    self.pageControl.currentPage = currentPage;
    
    [self updateInfo];
}

- (IBAction)selectPage:(UIPageControl *)sender
{
    self.contentScrollView.contentOffset = CGPointMake(self.pageControl.currentPage*self.contentScrollView.frame.size.width, 0.0);
    
    [self updateInfo];
}

- (IBAction)selectAction:(UIButton *)sender
{
    if (self.selectActionBlock) {
        self.selectActionBlock(self.pageControl.currentPage);
    }
}

- (void)updateInfo
{
    NSString *title = (self.pageControl.currentPage == 0) ? @"斗鱼" : ((self.pageControl.currentPage == 1) ? @"YY" : @"映客");
    self.titleLabel.text = [NSString stringWithFormat:@"%@个人资料页", title];
    [self.selectBtn setTitle:[NSString stringWithFormat:@"选择%@", title] forState:UIControlStateNormal];
    [self.selectBtn setTitle:[NSString stringWithFormat:@"选择%@", title] forState:UIControlStateHighlighted];
}

@end
