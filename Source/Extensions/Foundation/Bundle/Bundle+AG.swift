//
//  Bundle+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - Get info
public extension Bundle {
  
  public var appName: String {
    return infoDictionary?["CFBundleName"] as! String
  }
  
  public var bundleId: String {
    return bundleIdentifier!
  }
  
  public var versionNumber: String {
    return infoDictionary?["CFBundleShortVersionString"] as! String
  }
  
  public var buildNumber: String {
    return infoDictionary?["CFBundleVersion"] as! String
  }
  
}



//MARK: - AG
public extension Bundle {
  
  public var ag: Bundle {
    guard let bundle_url = url(forResource: "AugustFriday", withExtension: "bundle") else {
      assertionFailure("Could not create a path to the bundle")
      return Bundle.main
    }
    
    guard let bundle = Bundle(url: bundle_url) else {
      assertionFailure("Could not load bundle")
      return Bundle.main
    }
    
    return bundle
  }
  
}
