Pod::Spec.new do |s|
  s.name             = 'OMTSocialFacebook'
  s.version          = '0.0.1'
  s.summary          = 'A short description of OMTSocial.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yangshiyu666/OMTSocial'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '864745256@qq.com' => 'wyh900207@126.com' }
  s.source           = { :git => 'https://github.com/yangshiyu666/OMTSocial.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.frameworks = 'UIKit'
  s.subspec 'Facebook' do |sp|
     sp.source_files = 'OMTSocial/Classes/Facebook/*'
     #sp.vendored_frameworks = 'OMTSocial-0.0.1/ios/OMTSocial.framework'
     #sp.public_header_files = 'OMTSocial-0.0.1/ios/OMTSocial.framework/Headers/*.{h}'
     # sp.dependency 'OMTSocial/Core'
  end

end
