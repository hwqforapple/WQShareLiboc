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
  s.summary          = '一键快速集成微博，微信，分享OC版'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

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

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  s.dependency "Weibo_SDK", :path=> "https://github.com/sinaweibosdk/weibo_ios_sdk.git"
end
