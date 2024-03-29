
Pod::Spec.new do |s|
  s.name             = 'OMTSocial'
  s.version          = '0.0.1'
  s.summary          = 'A short description of OMTSocial.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/yangshiyu666/OMTSocial'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '864745256@qq.com' => 'wyh900207@126.com' }
  #s.source           = { :git => 'https://github.com/yangshiyu666/OMTSocial.git', :tag => s.version.to_s }
  s.source           = { :git => '/Users/zwd/Desktop/业务组件/OMTSocial'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  #s.source_files = 'OMTSocial/Classes/**/*'
  s.frameworks = 'UIKit'
  s.subspec 'Core' do |sp|
    sp.ios.vendored_frameworks = 'OMTSocial-0.0.1/ios/OMTSocial.framework'
    sp.public_header_files = 'OMTSocial-0.0.1/ios/OMTSocial.framework/Headers/*.{h}'
  end
  
  s.subspec 'Facebook' do |sp|
     sp.ios.vendored_frameworks = 'OMTSocialFacebook-0.0.1/ios/OMTSocialFacebook.framework'
     sp.public_header_files = 'OMTSocialFacebook-0.0.1/ios/OMTSocialFacebook.framework/Headers/*.{h}'
     sp.dependency 'OMTSocial/Core'
  end
  
 
end
