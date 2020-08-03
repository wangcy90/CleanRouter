Pod::Spec.new do |s|
  s.name             = 'CleanRouter'
  s.version          = '1.0.0'
  s.summary          = 'A swift style router.'
  s.homepage         = 'https://github.com/wangcy90/CleanRouter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WangChongyang' => 'chongyangfly@163.com' }
  s.source           = { :git => 'https://github.com/wangcy90/CleanRouter.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.4.0'
  s.ios.deployment_target = '9.0'
  s.source_files = 'CleanRouter/**/*'
end
