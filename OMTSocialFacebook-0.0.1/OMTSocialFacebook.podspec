Pod::Spec.new do |s|
  s.name = "OMTSocialFacebook"
  s.version = "0.0.1"
  s.summary = "A short description of OMTSocial."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"864745256@qq.com"=>"wyh900207@126.com"}
  s.homepage = "https://github.com/yangshiyu666/OMTSocial"
  s.description = "TODO: Add long description of the pod here."
  s.frameworks = "UIKit"
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/OMTSocialFacebook.framework'
end
