//
//  AGDefaults.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 21/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDefaults
protocol AGDefaults {
  static func getAll() -> [String: Any]
  static func removeAll()
}



//MARK: - Implements
extension AGDefaults {
  
  static func getAll() -> [String: Any] {
    let ud = UserDefaults.standard
    return ud.dictionaryRepresentation()
  }
  
  static func removeAll() {
    let ud = UserDefaults.standard
    ud.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    ud.synchronize()
  }
  
}
