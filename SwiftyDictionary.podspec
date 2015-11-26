Pod::Spec.new do |s|
  s.name             = "SwiftyDictionary"
  s.version          = "0.1.0"
  s.summary          = "A Swift wrapper for the Dictionary API"
  s.description      = <<-DESC"This Cocoapod allows developers to use the Dictionary API from Merriam Webster"
                       DESC
  s.homepage         = "https://github.com/justinvyu/SwiftyDictionary"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Justin Yu" => "justin.v.yu@gmail.com" }
  s.source           = { :git => "https://github.com/justinvyu/SwiftyDictionary.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwiftyDictionary' => ['Pod/Assets/*.png']
  }
  s.dependency 'Alamofire', '~> 3.0'
  s.dependency 'AEXML'
end
