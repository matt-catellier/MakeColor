#
# Be sure to run `pod lib lint MakeColor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MakeColor"
  s.version          = "0.1.0"
  s.summary          = "A hex color library to programatically assign colors using SWIFT."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                            Make Color is a lightweight and easy to use SWIFT library created to programatically change assign color using hex values. Coming from a web background, the RGB color system of SWIFT and XCODE can be a little confusing, so we made 7 simple functions to help you out. There are also a number of built in color schemes taht we have set up for you
                       DESC

  s.homepage         = "https://github.com/cj8397/MakeColor"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Matthew Catellier" => "Matt Catellier" , "Cheng Jiang" => "Cheng Jiang"}
  s.source           = { :git => "https://github.com/cj8397/MakeColor.git", :tag => 'v0.1.0' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MakeColor' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
