# ZJAnimationPopView
ZJAnimationPopView是一个轻量级、无侵入性、可扩展的动画弹框库，支持手写和xib控件，支持横竖屏。动画样式分为显示时和移除时两种类型，两两组合可以配置出72种(8*9)不同的弹框动画效果。

<div align=left>
<img width="300" height="534" src="http://g.recordit.co/nUahvS453Z.gif"/>
<img width="300" height="319" src="http://g.recordit.co/Vce1183QdS.gif"/>
</div>


## Contents
* [Getting Started 【开始使用】](#Getting_Started)
* [Features 【能做什么】](#Features)
* [Installation 【安装】](#Installation)
* [Examples 【示例】](#Examples)
* [The custom content and property](#Custom_Content)
* [The default Configure](#Default_Configure)
* [The custom attributed string](#Custom_AttributedString)

---

# <a id="Getting_Started"></a> Getting Started【开始使用】

## <a id="Features"></a> Features【能做什么】
ZJUnFoldView是一个快速便捷展开或折叠内容详情的控件。
- 内容详情支持自定义属性文字，甚至只需传入一段文字内容。
- 支持默认折叠的行数和展开按钮位置等功能。

## <a id="Installation"></a> Installation【安装】

### From CocoaPods【使用CocoaPods】

```ruby
pod 'ZJUnFoldView'
```

### Manually【手动导入】
- Drag all source files under floder `ZJUnFoldView` to your project.【将`ZJUnFoldView`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "ZJUnFoldView.h"`【导入主头文件：`#import "ZJUnFoldView.h"`】

```objc
ZJUnFoldView.h                      ZJUnFoldView.m
ZJUnFoldAttributedString.h          ZJUnFoldAttributedString.m
ZJUnFoldParagraphStyle.h            ZJUnFoldParagraphStyle.m
ZJUnFoldView+Untils.h               ZJUnFoldView+Untils.m
```
# <a id="Examples"></a> Examples【示例】

### <a id="Custom_Content"></a> The custom content and property【通过自定义内容和属性】
```objc
// 1.获取属性字符串：自定义内容和属性
ZJUnFoldAttributedString *unFoldAttrStr = [[ZJUnFoldAttributedString alloc] initWithContent:@"人生，如一幅春夏秋冬的景象，岁月，像一趟穿越四季的列车，我们都在路上。际遇是沿途的风光，无论我们是无视或是欣赏，终究都成为匆匆的过往。珍惜吧，珍惜会让生命中的美好增加一些重量。豁然吧，豁然是因为明白一切的风霜仅仅是过场。"
contentFont:[UIFont systemFontOfSize:12.0f]
contentColor:[ZJUnFoldView colorWithHexString:@"#8b8b8b"]
unFoldString:@"[显示全文]"
foldString:@"[收回]"
unFoldFont:[UIFont systemFontOfSize:12.0f]
unFoldColor:[ZJUnFoldView colorWithHexString:@"#dd4991"]
lineSpacing:7.0f];

// 2.添加展开视图
ZJUnFoldView *unFoldView = [[ZJUnFoldView alloc] initWithAttributedString:unFoldAttrStr maxWidth:200.0f isDefaultUnFold:NO foldLines:3 location:UnFoldButtonLocationRight];
unFoldView.frame = CGRectMake(100, 100, unFoldView.frame.size.width, unFoldView.frame.size.height);
unFoldView.backgroundColor = [UIColor orangeColor];
[self.view addSubview:unFoldView];
```

### <a id="Default_Configure"></a> The default Configure【通过默认配置】
```objc
// 1.获取属性字符串：默认配置
ZJUnFoldAttributedString *unFoldAttrStr = [ZJUnFoldAttributedString defaultConficAttributedString:@"人生，如一幅春夏秋冬的景象，岁月，像一趟穿越四季的列车，我们都在路上。际遇是沿途的风光，无论我们是无视或是欣赏，终究都成为匆匆的过往。珍惜吧，珍惜会让生命中的美好增加一些重量。豁然吧，豁然是因为明白一切的风霜仅仅是过场。"];

// 2.添加展开视图
ZJUnFoldView *unFoldView = [[ZJUnFoldView alloc] initWithAttributedString:unFoldAttrStr maxWidth:200.0f isDefaultUnFold:NO foldLines:3 location:UnFoldButtonLocationRight];
unFoldView.frame = CGRectMake(100, 100, unFoldView.frame.size.width, unFoldView.frame.size.height);
unFoldView.backgroundColor = [UIColor orangeColor];
[self.view addSubview:unFoldView];
```

### <a id="Custom_AttributedString"></a> The custom attributed string【通过自定义属性字符串】
```objc
// 1.自定义属性字符串
// 1.1 内容属性字符串
NSAttributedString *contentAttrStr = [[NSAttributedString alloc] initWithString:@"人生，如一幅春夏秋冬的景象，岁月，像一趟穿越四季的列车，我们都在路上。际遇是沿途的风光，无论我们是无视或是欣赏，终究都成为匆匆的过往。珍惜吧，珍惜会让生命中的美好增加一些重量。豁然吧，豁然是因为明白一切的风霜仅仅是过场。" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.0f], NSForegroundColorAttributeName : [ZJUnFoldView colorWithHexString:@"#8b8b8b"]}];
// 1.2 展开属性字符串
NSAttributedString *unFoldAttrStr = [[NSMutableAttributedString alloc] initWithString:@"[显示全文]" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.0f], NSForegroundColorAttributeName : [ZJUnFoldView colorWithHexString:@"#dd4991"]}];
// 1.3 折叠属性字符串
NSAttributedString *foldAttrStr = [[NSMutableAttributedString alloc] initWithString:@"[收回]" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12.0f], NSForegroundColorAttributeName : [ZJUnFoldView colorWithHexString:@"#dd4991"]}];
// 1.4 样式
ZJUnFoldParagraphStyle *paragraphStyle = [ZJUnFoldParagraphStyle initWithLineSpacing:7.0f];

// 2.获取属性字符串：自定义属性字符串
ZJUnFoldAttributedString *attrStr = [[ZJUnFoldAttributedString alloc] initWithContentAttrStr:contentAttrStr unFoldAttrStr:unFoldAttrStr foldAttrStr:foldAttrStr paragraphStyle:paragraphStyle];

// 3.添加展开视图
ZJUnFoldView *unFoldView = [[ZJUnFoldView alloc] initWithAttributedString:attrStr maxWidth:200.0f isDefaultUnFold:NO foldLines:3 location:UnFoldButtonLocationRight];
unFoldView.frame = CGRectMake(100, 100, unFoldView.frame.size.width, unFoldView.frame.size.height);
unFoldView.backgroundColor = [UIColor orangeColor];
[self.view addSubview:unFoldView];
```

## 期待
* 如果在使用过程中遇到BUG，请Issues我，谢谢
* 如果你想为ZJUnFoldView输出代码，请拼命Pull Requests我
