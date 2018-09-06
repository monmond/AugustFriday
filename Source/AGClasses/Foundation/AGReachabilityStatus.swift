//
//  AGReachabilityStatus.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - AGReachabilityStatus
public enum AGReachabilityStatus {
  
  case notReachable
  case reachableViaWiFi
  case reachableViaWWAN
  
}



public extension AGReachabilityStatus {
  
  public var getDescription: String {
    var result = ""
    switch self {
    case .notReachable:
      result = "Network not reachable"
    case .reachableViaWiFi:
      result = "NetworkReachableWifi"
    case .reachableViaWWAN:
      result = "Network reachable wan"
    }
    return result
  }
  
}
