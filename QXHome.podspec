#
# Be sure to run `pod lib lint QXHome.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QXHome'
  s.version          = '0.1.0'
  s.summary          = 'A short description of QXHome.'
  s.description      = <<-DESC
  Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/aloow/QXHome'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aloow' => 'xuesq@pvc123.com' }
  s.source           = { :git => 'https://github.com/aloow/QXHome.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'

  s.source_files = 'QXHome/Classes/**/*'
  s.resources = 'QXHome/Assets/*.{xcassets}'
 
  s.dependency 'JXCategoryView', '~> 1.5.6' # 标签滚动
  s.dependency 'YYCategories','~> 1.0.4'
  s.dependency 'Masonry','~> 1.1.0'
  s.dependency 'SDCycleScrollView','>= 1.80' # 图片、文字轮播器
  
end
