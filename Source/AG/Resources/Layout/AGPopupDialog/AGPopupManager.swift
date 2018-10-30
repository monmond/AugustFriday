//
//  PopupManager.swift
//  TestSlim
//
//  Created by sasawat sankosik on 12/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog



//MARK: - AGPopupPriority
public enum AGPopupPriority: Int {
  case common = 0
  case cilent
  case api
  case token
  case timeOut
}



//MARK: - AGPopupManager
public class AGPopupManager {
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public static let shared = AGPopupManager()
  
  
  
  //MARK: - Flag
  public var flag_alert = false
  
  
  
  //MARK: - Storage
  public var priority: AGPopupPriority = .common
  
  
  
  //MARK: - Initial
  private init() { }
  
  
  
}



//MARK: - Commons
public extension AGPopupManager {
  
  public func isHigher(with priority: AGPopupPriority) -> Bool {
    return priority.rawValue >= self.priority.rawValue
  }
  
  public func setPriority(with priority: AGPopupPriority) {
    self.priority = priority
  }
  
}



//MARK: - Commons
public extension AGPopupManager {
 
  
}
