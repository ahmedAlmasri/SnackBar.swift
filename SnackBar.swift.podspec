#
# Be sure to run `pod lib lint SnackBar.swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SnackBar.swift'
  s.version          = '0.1.0'
  s.summary          = 'SnackBar provide brief feedback about an operation through a message at the bottom of the screen.'

  s.description      = <<-DESC
     Snackbars provide brief feedback about an operation through a message at the bottom of the screen. Snackbars contain up to two lines of text directly related to the operation performed. They may contain a text action.

                       DESC

  s.homepage         = 'https://github.com/ahmedAlmasri/SnackBar.swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahmad Almasri' => 'ahmed.almasri@ymail.com' }
  s.source           = { :git => 'https://github.com/ahmedAlmasri/SnackBar.swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'

  s.source_files = 'SnackBar.swift/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
	s.dependency 'SnapKit'
end
