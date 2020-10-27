//
//  ViewController.m
//  ZJAnimationPopViewDemo
//
//  Created by Abnerzj on 2017/8/12.
//  Copyright © 2017年 Abnerzj. All rights reserved.
//

#import "ViewController.h"
#import "ZJAnimationPopView.h"
#import "PersonalInfoPopView.h"
#import "SlideSelectCardView.h"
#import "LineFromBottomView.h"
#import "ZJAlertView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSArray *_dataList;
    UISegmentedControl *_segCtrl;
    id _customView;
    PersonalInfoType _personalInfoType;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initDataAndSubViews];
}

#pragma mark - UITableView DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"ZJAnimationPopViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row >= 0 && indexPath.row < _dataList.count) {
        NSDictionary *dict = _dataList[indexPath.row];
        cell.textLabel.text = dict[@"title"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= 0 && indexPath.row < _dataList.count) {
        NSDictionary *dict = _dataList[indexPath.row];
        NSInteger style = ((NSNumber *)dict[@"style"]).integerValue;
        [self showPopAnimationWithAnimationStyle:style];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120.0f)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, bgView.frame.size.width - 30, 80.0f)];
    headerLabel.text = @"ZJAnimationPopView一个快速便捷、无侵入、可扩展的动画弹框库，两句代码即可实现想要的动画弹框。支持手写和xib，支持横竖屏。动画样式分为显示时和移除时两种类型，两两组合可以配置出72种(8*9)不同的弹框动画效果。";
    headerLabel.textColor = [UIColor darkTextColor];
    headerLabel.numberOfLines = 0;
    headerLabel.font = [UIFont systemFontOfSize:13.0f];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    [bgView addSubview:headerLabel];
    
    if (!_segCtrl) {
        _segCtrl = [[UISegmentedControl alloc] initWithItems:@[@"滑动选择卡片", @"个人资料卡片", @"Alert弹框"]];
        _segCtrl.selectedSegmentIndex = 0;
        _segCtrl.apportionsSegmentWidthsByContent = YES;
        [_segCtrl addTarget:self action:@selector(segCtrlAction:) forControlEvents:UIControlEventValueChanged];
        [self segCtrlAction:_segCtrl];
    }
    _segCtrl.frame = CGRectMake(15, CGRectGetMaxY(headerLabel.frame), bgView.frame.size.width - 30 , 32.0f);
    [bgView addSubview:_segCtrl];

    return bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

#pragma mark 显示弹框
- (void)showPopAnimationWithAnimationStyle:(NSInteger)style
{
    ZJAnimationPopStyle popStyle = (ZJAnimationPopStyle)style;
    ZJAnimationDismissStyle dismissStyle = (ZJAnimationDismissStyle)style;
    if (style == 8) {
        popStyle = ZJAnimationPopStyleCardDropFromLeft;
        dismissStyle = ZJAnimationDismissStyleCardDropToTop;
    } else if (style == 9) {
        popStyle = ZJAnimationPopStyleLineFromBottom;
        _customView = [LineFromBottomView xib];
    }
    if ([_customView isKindOfClass:[LineFromBottomView class]] && style != 9) {
        _customView = nil;
        [self segCtrlAction:_segCtrl];
    }
    
    // 1.初始化
    ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:_customView popStyle:popStyle dismissStyle:dismissStyle];
    
    // 2.设置属性，可不设置使用默认值，见注解
    // 2.1 显示时点击背景是否移除弹框
    popView.isClickBGDismiss = ![_customView isKindOfClass:[SlideSelectCardView class]];
    // 2.2 显示时背景的透明度
    popView.popBGAlpha = 0.5f;
    // 2.3 显示时是否监听屏幕旋转
    popView.isObserverOrientationChange = YES;
    // 2.4 显示时动画时长
//    popView.popAnimationDuration = 0.8f;
    // 2.5 移除时动画时长
//    popView.dismissAnimationDuration = 0.8f;

    // 2.6 显示完成回调
    popView.popComplete = ^{
        NSLog(@"显示完成");
    };
    // 2.7 移除完成回调
    popView.dismissComplete = ^{
        NSLog(@"移除完成");
    };
    
    // 3.处理自定义视图操作事件
    [self handleCustomActionEnvent:popView];
    
    // 4.显示弹框
    // 4.1 弹框的父视图，建议设置为控制器的根视图，不设置则用keyWindow
//    popView.superView = self.view;
    
    // 显示
    [popView pop];
}

#pragma mark 选项卡监听
- (void)segCtrlAction:(UISegmentedControl *)segCtrl
{
    if (segCtrl.selectedSegmentIndex == 0) {
//        // 手写控件
//        UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//        
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:customView.bounds];
//        imageView.image = [UIImage imageNamed:@"personal_info_02"];
//        [customView addSubview:imageView];
//        _customView = customView;
        
        // xib
        _customView = [SlideSelectCardView xib];
        if (_personalInfoType != PersonalInfoTypeDouYu) {
            [_customView updatePage:(_personalInfoType - 1)];
        }
    } else if (segCtrl.selectedSegmentIndex == 1) {
        _customView = [PersonalInfoPopView xibWithPersonalInfoType:_personalInfoType]; 
    } else if (segCtrl.selectedSegmentIndex == 2) {
        _customView = [ZJAlertView xib];
    }
}

#pragma mark 处理自定义视图操作事件
- (void)handleCustomActionEnvent:(ZJAnimationPopView *)popView
{
    // 在监听自定义视图的block操作事件时，要使用弱对象来避免循环引用
    __weak typeof(popView) weakPopView = popView;
    __weak typeof(_segCtrl) weakSegCtrl = _segCtrl;
    if ([_customView isKindOfClass:[SlideSelectCardView class]]) {
        SlideSelectCardView *cardView = _customView;
        cardView.selectActionBlock = ^(NSUInteger currentPage) {
            _personalInfoType = (PersonalInfoType)(currentPage + 1);
            NSString *segTitle = (_personalInfoType == PersonalInfoTypeDouYu) ? @"斗鱼" : ((_personalInfoType == PersonalInfoTypeYY) ? @"YY" : @"映客");
            [weakSegCtrl setTitle:[NSString stringWithFormat:@"%@个人资料卡片", segTitle] forSegmentAtIndex:1];
            weakSegCtrl.apportionsSegmentWidthsByContent = YES;
            
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[PersonalInfoPopView class]]) {
        PersonalInfoPopView *infoPopView = _customView;
        infoPopView.closeActionBlock = ^{
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[LineFromBottomView class]]) {
        LineFromBottomView *lineFromBottomView = _customView;
        lineFromBottomView.doneActionBlock = ^{
            [weakPopView dismiss];
        };
    } else if ([_customView isKindOfClass:[ZJAlertView class]]) {
        ZJAlertView *alertView = _customView;
        alertView.canceSureActionBlock = ^(BOOL isSure) {
            [weakPopView dismiss];
            NSLog(@"点击了%@", isSure ? @"确定" : @"取消");
        };
    }
}

#pragma mark 设备方向改变
- (void)statusBarOrientationChange:(NSNotification *)notification
{
    _tableView.frame = self.view.bounds;
    [_tableView reloadData];
}

- (void)initDataAndSubViews
{
    _personalInfoType = PersonalInfoTypeDouYu;
    _dataList = @[@{@"title" : @"卡片式掉落动画(从左侧)", @"style" : @6},
                  @{@"title" : @"卡片式掉落动画(从右侧)", @"style" : @7},
                  @{@"title" : @"卡片式掉落动画(往顶部平滑消失)", @"style" : @8},
                  @{@"title" : @"从顶部掉落晃动动画", @"style" : @2},
                  @{@"title" : @"从底部掉落晃动动画", @"style" : @3},
                  @{@"title" : @"从左侧掉落晃动动画", @"style" : @4},
                  @{@"title" : @"从右侧掉落晃动动画", @"style" : @5},
                  @{@"title" : @"平滑线性从底部推出动画", @"style" : @9},
                  @{@"title" : @"缩放动画", @"style" : @1},
                  @{@"title" : @"无动画", @"style" : @0}];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.separatorInset = UIEdgeInsetsZero;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
