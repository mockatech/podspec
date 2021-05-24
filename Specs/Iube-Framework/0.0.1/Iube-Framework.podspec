Pod::Spec.new do |spec|
  spec.name = 'Iube-Framework'
  spec.version = '0.0.1'
  spec.homepage = 'https://github.com/mockatech/iube-framework'
  spec.source = { :git => "https://github.com/mockatech/iube-framework.git", :tag => "{spec.version}" }
  spec.authors = 'TheoLM'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.summary = 'SDK to connect with IUBE API'
  spec.static_framework = true
  spec.vendored_frameworks = "shared.framework
  spec.libraries = "c++"
  spec.module_name = "#shared.framework"
  spec.ios.deployment_target = '13.0'
end