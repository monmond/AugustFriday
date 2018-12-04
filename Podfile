# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'



# Remove pods project warning
# Method1: inhibit_all_warnings -> YES
# Method2: add inhibit_all_warnings! in podfile
inhibit_all_warnings!



def ui_pods
  # note
  pod 'NVActivityIndicatorView', '~> 4.4.0'
  # note
  pod 'SnapKit', '~> 4.2.0'
  # note
#  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
  # note
  pod 'PopupDialog', '~> 0.9'
  # note
  pod 'IQKeyboardManagerSwift', '~> 6.0.5'
  # note
  pod 'SkeletonView', '~> 1.4'
  # note
#  pod 'NotificationBannerSwift', '~> 1.8.0'
  # using tempolary until master update podspec cause by snapkit dependency
  pod 'NotificationBannerSwift', :git => 'https://github.com/Arcovv/NotificationBanner.git', :branch => 'master'
end



def db_pods
  
  
end



def networking_pods
  # note (5.7.0)
  pod 'Firebase/Core'
  # note (3.1.1)
  pod 'Firebase/Messaging'
  # note (5.0.2)
  pod 'Firebase/Database'
  # note (5.0.3)
  pod 'Firebase/Auth'
  # note
#  pod 'Alamofire', '~> 4.7'
  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
  # note
  pod 'SwiftyJSON', '~> 4.1.0'
  # note
  # pod 'Kingfisher' , '~> 4.8'
  # note
#  pod 'CodableFirebase'
  # note
  pod 'Kingfisher', '~> 4.10.0'
end



def social_pods
  # pod 'GoogleSignIn'
  # pod 'FacebookCore'
  # pod 'FacebookLogin'
  # pod 'FacebookShare'
  # pod 'Firebase/Core', '~> 3.15'
  # pod 'Firebase/Messaging'
end



# Pods for OMU
def ag_pods
  
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # UI
  ui_pods
  
  # DB
  db_pods
  
  # Networking
  networking_pods
  
  # Social
  social_pods
  
end

target 'AugustFriday' do
  
  ag_pods
  swift_4_0_pods = ['SkeletonView']
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      if swift_4_0_pods.include? target.name
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.0'
        end
      end
    end
  end
  
end
