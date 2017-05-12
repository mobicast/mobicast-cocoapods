#
# Be sure to run `pod lib lint Mobicast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'Mobicast'
s.version          = '1.1.1'
s.summary          = 'Mobicast video player.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC

import Mobicast

Discovery.init(viewController: self)

DESC

s.homepage         = 'https://github.com/mobicast/mobicast-cocoapods'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = 'Mobicast'
s.source           = { :git => 'https://github.com/mobicast/mobicast-cocoapods.git', :tag => '#{s.version}' }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.ios.deployment_target = '8.0'

s.vendored_frameworks = 'Mobicast/Framework/Mobicast.framework'

# s.resource_bundles = {
#   'Mobicast' => ['Mobicast/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
s.frameworks = 'UIKit', 'AVFoundation'
s.dependency 'GoogleAds-IMA-iOS-SDK', '3.5.2'
s.dependency 'google-cast-sdk', '3.2.0'
end
