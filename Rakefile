$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'facebook auth example'
  app.weak_frameworks += %w(AdSupport Accounts Social)
  app.info_plist['CFBundleURLTypes'] = [{'CFBundleURLSchemes' => ['fbYOUR-APP-ID']}]
  app.pods do
    pod 'Facebook-iOS-SDK'
  end
end
