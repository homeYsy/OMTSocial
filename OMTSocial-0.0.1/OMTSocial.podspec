Pod::Spec.new do |s|
  s.name = "OMTSocial"
  s.version = "0.0.1"
  s.summary = "A short description of OMTSocial."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"Xiaoye220"=>"576934532@qq.com"}
  s.homepage = "https://github.com/yangshiyu666/OMTSocial"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '8.0'
  s.ios.vendored_framework   = 'ios/OMTSocial.framework'
end
