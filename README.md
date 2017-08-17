# ZJAnimationPopView

[![Platform](https://img.shields.io/badge/platform-iOS-red.svg)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-OC-yellow.svg?style=flat )](https://en.wikipedia.org/wiki/Objective-C) 
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://mit-license.org)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ZJAnimationPopView.svg)](https://img.shields.io/cocoapods/v/ZJAnimationPopView.svg)
[![Weibo](https://img.shields.io/badge/weibo-@Abnerzj-blue.svg?style=flat)](http://weibo.com/ioszj)


- A fast, convenient view to show animation pop view, it support 72 kinds of animation pop effect.
- ZJAnimationPopView是一个快速便捷、无侵入、可扩展的动画弹框库，两句代码即可实现想要的动画弹框。支持手写和xib，支持横竖屏。可以配置出72种不同的弹框动画效果。

---

<div align=left>
<img width="284.5" height="505.5" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_01.gif"/>
<img width="284" height="506.5" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_02.gif"/>
<img width="284.5" height="505.5" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_03.gif"/>
</div>
<div align=left>
<img width="284.5" height="505" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_04.gif"/>
<img width="285" height="506.5" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_05.gif"/>
</div>
<div align=left>
<img width="696" height="494" src="https://github.com/Abnerzj/Resources/blob/master/ZJImages/ZJAnimationPopView/ZJAnimationPopView_06.gif"/>
</div>

---

# Getting Started【开始使用】
## Features【能做什么】
- 动画样式分为显示时和移除时两种类型，两两组合可以配置出72种(8*9)不同的弹框动画效果。
- 动画样式可扩展，代码简洁易读，自行添加想要的显示样式和移除样式即可。
- 自定义控件支持手写和xib。
- 支持横竖屏和横竖屏切换监听。
- 支持自定义背景透明度。
- 支持设置显示时和移除时的动画时长。

## Installation【安装】

### From CocoaPods【使用CocoaPods】

```ruby
pod 'ZJAnimationPopView'
```

### Manually【手动导入】
- Drag all source files under floder `ZJAnimationPopView` to your project.【将`ZJAnimationPopView`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "ZJAnimationPopView.h"`【导入主头文件：`#import "ZJAnimationPopView.h"`】

```objc
ZJAnimationPopView.h                      
ZJAnimationPopView.m
```
# Examples【示例】
## Direct Use【直接使用】
```objc
// 1.初始化
ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:customView popStyle:ZJAnimationPopStyleScale dismissStyle:ZJAnimationDismissStyleScale];
// 2.显示弹框
[popView pop];
```
## User-defined properties【自定义想要的弹框效果】
```objc
// 1.Get custom view【获取自定义控件】
UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];

UIImageView *imageView = [[UIImageView alloc] initWithFrame:customView.bounds];
imageView.image = [UIImage imageNamed:@"personal_info_02"];
[customView addSubview:imageView];

// 2.Init【初始化】
ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:customView popStyle:ZJAnimationPopStyleScale dismissStyle:ZJAnimationDismissStyleScale];

// 3.Set properties,can not be set【设置属性，可不设置使用默认值，见注解】
// 3.1 显示时点击背景是否移除弹框
popView.isClickBGDismiss = ![_customView isKindOfClass:[SlideSelectCardView class]];
// 3.2 显示时背景的透明度
popView.popBGAlpha = 0.5f;
// 3.3 显示时是否监听屏幕旋转
popView.isObserverOrientationChange = YES;
// 3.4 显示时动画时长
popView.popAnimationDuration = 0.8f;
// 3.5 移除时动画时长
popView.dismissAnimationDuration = 0.8f;

// 3.6 显示完成回调
popView.popComplete = ^{
NSLog(@"显示完成");
};
// 3.7 移除完成回调
popView.dismissComplete = ^{
NSLog(@"移除完成");
};

// 4.pop view【显示弹框】
[popView pop];
```

## 期待
* 如果在使用过程中遇到BUG，请Issues我，谢谢
* 如果你想为ZJAnimationPopView输出代码，请拼命Pull Requests我
