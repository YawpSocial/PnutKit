Pod::Spec.new do |s|

s.name                    = "PnutKit"
s.version                 = "0.4"
s.summary                 = "A client library for the Pnut.io social network written in Swift"

s.homepage                = "https://pnut.io"
s.license                 = { :type => 'MIT', :file => 'LICENSE' }
s.author                  = { "Paul Schifferer" => "paul@schifferers.net" }
s.social_media_url        = "https://twitter.com/paulyhedral"

s.source                  = { :git => "https://github.com/exsortis/PnutKit.git", :tag => s.version.to_s, :submodules => true }
s.source_files            = 'Sources/**/*.{h,m,c,swift}'
s.frameworks              = 'Foundation'

s.ios.deployment_target   = '10.2'
s.osx.deployment_target   = '10.12'

s.requires_arc            = true

end
