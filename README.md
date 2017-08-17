# ZJAnimationPopView

[![Platform](https://img.shields.io/badge/platform-iOS-red.svg)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-OC-yellow.svg?style=flat )](https://en.wikipedia.org/wiki/Objective-C) 
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](http://mit-license.org)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ZJAnimationPopView.svg)](https://img.shields.io/cocoapods/v/ZJAnimationPopView.svg)
[![Weibo](https://img.shields.io/badge/微博-@Abnerzj-f65a14.svg?style=flat)](http://weibo.com/ioszj)
[![Jianshu](https://img.shields.io/badge/%E7%AE%80%E4%B9%A6-%40Abnerzj-e55844.svg?logo=data%3aimage%2fpng%3bbase64%2ciVBORw0KGgoAAAANSUhEUgAAAHAAAAA0CAMAAABl90wDAAAAjVBMVEUAAADrcFvqb1rrcVztclzuc17tc13rcFrrb1rtcl3qcFvrcVrrcFvscFvrcFrud2Tsb1rtcVvrcFzqb1vscFv0eWPrcFvscFvrb1rscFzrcFzscV3%2fiX3rb1rtcVzrb1rrcFrrcFv%2ffmLrcFrsc1%2frcFrrcFrrcFvwdF3scFvrcFvzdWPrcFrscFvqb1raTo%2bjAAAALnRSTlMA9MRXKS4bym480mbOhIIOhVOL7J4X2WvwWU02BKtD38CRCaMm%2bea2IHlzE5ZgwvLvugAAAo5JREFUeAHt1%2bu%2bcloUx%2fG%2fg2TRkkKWSEnnGvd%2feXsORYfUw9L2Yu%2fn%2b7Y%2b85eGOQsuPBJWRzwySQgc1CYT6%2bFPTGI6Hm2IfbcLehN2qFjYxAN7lV95r0WwXH2DG9mK2Ghwow9gTywZ3Zk2Dm4DEva4iumZDBwCqhA2DqJPwipDYUYVYmBBVbTmwSi5%2b1K1gCqYOFGVddo8CJOYg1y2JjYwzZiExMyFCImt%2b5PJjthowswtbm21exaxmfbgkDe%2bwKYJsT4A7ebjRfsVCYEGwcqDqBBTLc6wGL89XBHbgfnlrtvOiY2nYLu8neLZqGZQLW7EMTFJQe5IQgJhSSzJkNNe3p77mkHoxDIQ%2b9JwdiJmF0HXxlkk5VPGs61UMzgk9s3BoP%2bjC5sUUGVhhHMwCVFaWpYla6iQqncsYppXii%2fBkJgM8ncHpD4JLkpcOEUotTja3EvwILEdDLCwmJGhXEyUatlvg1XvSyJ%2b%2bb3%2bh4LOZbVBV8Fofb5Es6sgFsQUT5de%2bmzQIObiNeNjwelMML5837dmnQT160GOroPedxXz3wuqVMV6FXR%2bCkrBJ7YzSzKxhZKLWgZ9ashuGZx%2fKOgOS%2frb4PJDwSlKi7dBzZceUU560j7Y8NlC%2fn8H3UFJ7yD47G%2bwdXA5LHUzQwOlxX8%2beCRB7nDjWyTEHwj6xNLqoKJeGC4xs33QIDau94u%2ftlsEQ0U4jSRiy3rBEC2COl1Jap2gP0ObYExXJp6C2fieH%2fdTXMx%2bFRxRYf3T8H%2fpnpjTMOi589zRtFE3GKW2ffCcgNi2frBajeCermJ0EHSoJG0%2fFtzgpSkVghlqBYPoT0FpnuGlyKLc%2bNhDjWDgx1O8pak23lM1wUMdvRRv%2fQNommOfb6EQtgAAAABJRU5ErkJggg%3d%3d&logoWidth=24&label=)](http://jianshu.com/u/f00ad5c62f05)


- A fast, convenient view to show animation pop view, it support 72 kinds of animation pop effect.【一个快速便捷、无侵入、可扩展的动画弹框库，两句代码即可实现想要的动画弹框。支持手写和xib，支持横竖屏。可以配置出72种不同的弹框动画效果。】
- PS:Recorded and found that the resulting loss of animation is not consistent, it is recommended to download and install Demo view.【录制后发现失帧造成动画效果不连贯，建议下载安装Demo查看。】
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
- 动画样式分为**显示时**和**移除时**两种类型，两两组合可以配置出72种**(8*9)**不同的弹框动画效果。
- 动画样式可扩展，代码**简洁易读**，自行添加想要的显示样式和移除样式即可。
- 自定义控件支持**手写**和**xib**。
- 支持**横竖屏**和**横竖屏切换监听**。
- 支持自定义**背景透明度**。
- 支持设置显示时和移除时的**动画时长**。

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
ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)] popStyle:ZJAnimationPopStyleScale dismissStyle:ZJAnimationDismissStyleScale];
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
