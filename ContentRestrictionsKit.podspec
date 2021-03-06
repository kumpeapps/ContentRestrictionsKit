Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '14.0'
s.name = "ContentRestrictionsKit"
s.summary = "Gets Devices Content Rating Restrictions"
#s.requires_arc = true

# 2
s.version          = ENV['LIB_VERSION'] || '1.1' #fallback to major version

# 3
s.license = { :type => "MIT", :file => "LICENSE"}

# 4 - Replace with your name and e-mail address
s.author = { "Justin Kumpe" => "helpdesk@kumpeapps.com" }
# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/kumpeapps/ContentRestrictionsKit.git"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => 'https://github.com/kumpeapps/ContentRestrictionsKit.git', :tag => "#{s.version}" }

# 7
s.framework = "Foundation"

# 8
s.source_files = "ContentRestrictionsKit/**/*.{swift,storyboard,xib,png}"

# 9
#s.resources = "ContentRestrictionsKit/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "5"

end
