#
# Be sure to run `pod lib lint ReuseCellConfigure.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ReuseCellConfigure"
  s.version          = "0.1.0"
  s.summary          = "A short description of ReuseCellConfigure."

  s.homepage         = "https://github.com/szk-atmosphere/ReuseCellConfigure"
  s.license          = 'MIT'
  s.author           = { "Taiki Suzuki" => "s1180183@gmail.com" }
  s.source           = { :git => "https://github.com/szk-atmosphere/ReuseCellConfigure.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/SzkAtmosphere'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'ReuseCellConfigure/*.{swift}'
  #s.resource_bundles = {
  #  'ReuseCellConfigure' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
