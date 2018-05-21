#
#  Be sure to run `pod spec lint TRPassField.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "TRPassField"
  s.version      = "0.0.1"
  s.summary      = "密码输入控件"
  s.homepage     = "https://github.com/wangmyQQ/TRPassField"
  s.license      = "MIT"
  s.author             = { "王明阳" => "1164719501@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@github.com:wangmyQQ/TRPassField.git", :tag => "#{s.version}" }
  s.source_files  = "TRPassField"
end
