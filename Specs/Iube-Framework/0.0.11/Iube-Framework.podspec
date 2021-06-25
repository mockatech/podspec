Pod::Spec.new do |s|
  s.name             = "Iube-Framework"
  s.version          = "0.0.11"
  s.summary          = "A short description of Iube-Framework."
  s.homepage         = "https://github.com/mockatech/iube-framework"
  s.author           = { "Theo" => "theolm.mota@gmail.com" }

  s.platform     = :ios, '11.0'
  s.requires_arc = true

  s.source        = { :git => "https://github.com/mockatech/iube-framework.git", :tag => "#{s.version}" }

  s.ios.vendored_frameworks = 'shared.framework'

  s.frameworks = 'UIKit'
  s.module_name = 'Iube-Framework'
end