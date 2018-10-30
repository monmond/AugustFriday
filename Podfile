# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

# Remove pods project warning
# Method1: inhibit_all_warnings -> YES
# Method2: add inhibit_all_warnings! in podfile
inhibit_all_warnings!

def ui_pods
  
  # Indicator
  pod 'NVActivityIndicatorView', '~> 4.0.0'
  # Auto layout helper
  pod 'SnapKit', '~> 4.0.0'
  # A library to simplify iOS animations in Swift
#  pod 'Spring', :git => 'https://github.com/MengTo/Spring.git'
  # Popup dialog
  pod 'PopupDialog', '~> 0.8.1'
  # Allows to prevent issues of keyboard sliding up and cover UITextField/UITextView.
  pod 'IQKeyboardManagerSwift', '~> 6.0.5'
  # Facebook Preloading, '~> 1.4'
  pod 'SkeletonView', '~> 1.4'
  # The easiest way to display highly customizable in app notification banners in iOS 1.6.3
  pod 'NotificationBannerSwift', '~> 1.6.3'
  
end

def db_pods
  
  
end

def networking_pods
  
  # Firebase Core 5.0.4
  pod 'Firebase/Core'
  # Firebase Messaging 3.0.2
  pod 'Firebase/Messaging'
  # Firebase Database 5.0.2
  pod 'Firebase/Database'
  # Firebase Auth 5.0.3
  pod 'Firebase/Auth'
  # Networking
  pod 'Alamofire', '~> 4.7'
#  pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
  # Json reader
  pod 'SwiftyJSON', '~> 4.1.0'
  # Image downloader and cacheing
  # pod 'Kingfisher' , '~> 4.8'
  # Codable Firebase 0.2.0
  pod 'CodableFirebase'
  # Image downloader and cacheing 4.9
  pod 'Kingfisher', '~> 4.6.3'
  
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

end
