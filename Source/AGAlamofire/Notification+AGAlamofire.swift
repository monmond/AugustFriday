//
//  Notification+AGAlamofire.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - Notification.Name
public extension Notification.Name {
  
  public static let reachabilityDidChange = Notification.Name("ReachabilityDidChange")
  public static let reachable = NSNotification.Name(rawValue: "unsuccessful")
  public static let unreachable = NSNotification.Name(rawValue: "unsuccessful")
  
}
