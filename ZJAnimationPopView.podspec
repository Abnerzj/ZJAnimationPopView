Pod::Spec.new do |s|
s.name         = "ZJAnimationPopView"
s.version      = "1.0.5"
s.summary      = "A fast, convenient view to show animation pop view."
s.description  = <<-DESC
A fast, convenient view to show animation pop view, it support 72 kinds of animation pop effect.
DESC
s.homepage     = "https://github.com/Abnerzj/ZJAnimationPopView"
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Abnerzj" => "Abnerzj@163.com" }
s.social_media_url   = "http://weibo.com/ioszj"
s.platform     = :ios, "7.0"
s.source       = { :git => "https://github.com/Abnerzj/ZJAnimationPopView.git", :tag => "#{s.version}" }
s.source_files  = "ZJAnimationPopView/*.{h,m}"
s.requires_arc = true
end
