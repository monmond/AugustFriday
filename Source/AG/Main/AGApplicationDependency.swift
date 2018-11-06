//
//  AGApplicationDependency.swift
//  AugustFriday
//
//  Created by Sasawat Sankosik on 6/11/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: AGApplicationRouter
public protocol AGApplicationDependency {
  func getDeviceToken(with deviceToken: Data) -> String
  func logDeviceToken(with deviceToken: Data)
}



//MARK: - Implements
public extension AGApplicationDependency {
  
  public func getDeviceToken(with deviceToken: Data) -> String {
    return deviceToken.reduce("", { $0 + String(format: "%02X", $1) })
  }
  
  public func logDeviceToken(with deviceToken: Data) {
    let token = getDeviceToken(with: deviceToken)
    AGLog.info(token)
  }
  
}
