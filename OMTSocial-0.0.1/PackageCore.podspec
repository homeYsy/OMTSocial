Pod::Spec.new do |s|
  s.name             = 'OMTSocial'
  s.version          = '0.0.1'
  s.summary          = 'A short description of OMTSocial.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/yangshiyu666/OMTSocial'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Xiaoye220' => '576934532@qq.com' }
  s.source           = { :git => 'https://github.com/yangshiyu666/OMTSocial.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.subspec 'Core' do |sp|
     sp.source_files = 'OMTSocial/Classes/*', 'OMTSocial/Classes/Core/*'
  end
end
