#
# Be sure to run `pod lib lint WQShareLiboc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WQShareLiboc'
  s.version          = '0.0.1'
  s.summary          = '快速分享到微博，微信等OC版'

  s.description      = <<-DESC
  集成微博，微信，QQ分享OC版，方便使用！
                       DESC

  s.homepage         = 'https://github.com/hwqforapple/WQShareLiboc'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huwenqiang' => 'hwqforapple@163.com' }
  s.source           = { :git => 'https://github.com/hwqforapple/WQShareLiboc.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WQShareLiboc/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WQShareLiboc' => ['WQShareLiboc/Assets/*.png']
  # }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Weibo_SDK'
  s.dependency 'WechatOpenSDK'
  # :git=> 'https://github.com/sinaweibosdk/weibo_ios_sdk.git'
end
