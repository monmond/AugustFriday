//
//  AGDefaultsCodable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDefaultsCodable
protocol AGDefaultsCodable: AGDefaultsFoundation where T: Codable {
  
}



//MARK: - Implements
extension AGDefaultsCodable {
  
  static func get() -> T? {
    let ud = UserDefaults.standard
    guard let userData = ud.data(forKey: key), let t = try? JSONDecoder().decode(T.self, from: userData) else {
      return nil
    }
    return t
  }
  
  static func set(data: T) {
    guard let encoded = try? JSONEncoder().encode(data) else {
      return
    }
    let ud = UserDefaults.standard
    ud.set(encoded, forKey: key)
  }
  
  static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}

