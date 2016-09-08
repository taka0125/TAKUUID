Pod::Spec.new do |s|
  s.name         = 'TAKUUID'
  s.version      = '1.2.0'
  s.license      = 'MIT'
  s.summary      = 'create UUID and store to Keychain library'
  s.homepage     = 'https://github.com/taka0125/TAKUUID'
  s.author       = { 'Takahiro Ooishi' => 'taka0125@gmail.com' }
  s.source       = { :git => 'https://github.com/taka0125/TAKUUID.git', :tag => s.version.to_s }
  s.requires_arc = true

  s.platform              = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.ios.frameworks        = 'Security'

  s.public_header_files = 'Classes/*.h'
  s.source_files = 'Classes/*.{h,m}'
end
