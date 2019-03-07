#
# Be sure to run `pod lib lint WQShareLiboc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WQShareLiboc'
  s.version          = '0.0.2'
  s.summary          = 'QQ，微博，微信分享库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  微信,QQ,新浪微博分享功能实现，简单集成，方便使用
                       DESC

  s.homepage         = 'https://github.com/hwqforapple/WQShareLiboc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hwqforapple@163.com' => 'hwqforapple@163.com' }
  s.source           = { :git => 'https://github.com/hwqforapple/WQShareLiboc.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WQShareLiboc/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WQShareLiboc' => ['WQShareLiboc/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.vendored_frameworks = 'WQShareLiboc/FrameWorks/TencentOpenAPI.framework'
  s.dependency 'Weibo_SDK'
  s.dependency 'WechatOpenSDK'
  s.dependency 'MBProgressHUD'
end
