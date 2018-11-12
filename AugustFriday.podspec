#
#  Be sure to run `pod spec lint AugustFriday.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#



# PodUtility
module PodUtility

	def self.mapSwiftFiles(path, depth)
		extension = '/*.swift'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapSBFiles(path, depth)
		extension = '/*.{storyboard,xib}'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapResourceFiles(path, depth)
		extension = '/*.{storyboard,xib,otf,xcassets}'
	  	source_files = mapFiles(path, depth, extension)
		source_files

	end

	def self.mapFiles(path, depth, extension)
		running = 0
		key_lookup = '/**'
		key_current = ""
		source_files = Array.new
		loop do 
		  if running > 0 
		  	key_current += key_lookup
		  end 
		  str_next = path + key_current + extension
		  source_files << str_next
		  running += 1
		  break if running > depth

		end 
		source_files

	end

end



Pod::Spec.new do |s|



# Profile
s.name = 'AugustFriday'
s.version = '0.1.0'
s.license = 'MIT'
s.summary = 'Hello World'
s.homepage = 'https://github.com/ssankosik/AugustFriday'
# s.social_media_url = 'http://twitter.com/AugustFriday'
s.authors = { 'AugustFriday Software Foundation' => 'aimangtub.mond@gmail.com' }



# Setting
s.source = { :git => 'https://github.com/ssankosik/AugustFriday.git', :tag => s.version }
s.ios.deployment_target = '10.0'
s.platform = :ios, '10.0'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
s.default_subspec = 'Core'



# Source
# Warning - beware of using the quote
str_source = 'Source'

# AGAlamofire
str_aga = "#{str_source}/AGAlamofire"

# AGFirebase
str_agf = "#{str_source}/AGFirebase"
str_agf_core = "#{str_agf}/Core"
str_agf_messagging = "#{str_agf}/Messagging"

# AG
str_ag = "#{str_source}/AG"
str_ag_classes = "#{str_ag}/Classes"
str_ag_resources = "#{str_ag}/Resources"
str_ag_main = "#{str_ag}/Main"


# Alamofire
s.subspec 'Alamofire' do |c|
	c.frameworks = 'UIKit'
	c.source_files = PodUtility.mapSwiftFiles(str_aga, 1)
	c.dependency 'AugustFriday/Core'
	c.dependency 'Alamofire', '~> 4.7'
	# c.dependency 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :branch => 'alamofire5'
	c.dependency 'SwiftyJSON', '~> 4.2'

end	

# Firebase
s.subspec 'Firebase' do |c|
	c.frameworks = 'UIKit', 'Firebase'
	c.source_files = PodUtility.mapSwiftFiles(str_agf_core, 1)
	c.dependency 'AugustFriday/Core'
	c.dependency 'Firebase/Core', '~> 5.0'

end	

# Messaging
s.subspec 'Messaging' do |c|
	c.frameworks = 'UIKit', 'Firebase'
	c.source_files = PodUtility.mapSwiftFiles(str_agf_messagging, 2)
	c.dependency 'AugustFriday/Core'
	c.dependency 'AugustFriday/Firebase'

end	

# Core
s.subspec 'Core' do |c|
	c.frameworks = 'UIKit'
	c.source_files = PodUtility.mapSwiftFiles(str_source, 0)
	c.exclude_files = "Source/Exclude"
	# PodUtility.mapResourceFiles(str_source, 0) may crash app
	# c.resource_bundle = {
	# 	'AugustFriday' => PodUtility.mapResourceFiles(str_source, 0)
	# }
	c.requires_arc = true
	c.dependency 'NVActivityIndicatorView', '~> 4.0'
	c.dependency 'SnapKit', '~> 4.0'
	c.dependency 'PopupDialog', '~> 0.9'
	c.dependency 'IQKeyboardManagerSwift', '~> 6.0'
	c.dependency 'SkeletonView', '~> 1.4'
	c.dependency 'NotificationBannerSwift', '~> 1.4'
	

	# AG
	c.subspec 'AG' do |agc|
		agc.frameworks = 'UIKit'
		agc.source_files = PodUtility.mapSwiftFiles(str_ag, 0)

		# Classes
		agc.subspec 'Classes' do |fd|
			fd.source_files = PodUtility.mapSwiftFiles(str_ag_classes, 4)

		end

		# Resources
		agc.subspec 'Resources' do |ui|
			ui.source_files = PodUtility.mapSwiftFiles(str_ag_resources, 4)
			agc.resource_bundle = {
				'AugustFriday' => PodUtility.mapResourceFiles(str_ag_resources, 4)
			}

		end

		# Main
		agc.subspec 'Main' do |m|
			m.source_files = PodUtility.mapSwiftFiles(str_ag_main, 2)
			
		end


	end

end

end
