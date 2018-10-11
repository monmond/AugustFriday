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
public protocol AGDefaultsCodable: AGDefaultsFoundation where T: Codable {
  
}



//MARK: - Implements
public extension AGDefaultsCodable {
  
  public static func get() -> T? {
    let ud = UserDefaults.standard
    guard let userData = ud.data(forKey: key), let t = try? JSONDecoder().decode(T.self, from: userData) else {
      return nil
    }
    return t
  }
  
  public static func set(data: T) {
    guard let encoded = try? JSONEncoder().encode(data) else {
      return
    }
    let ud = UserDefaults.standard
    ud.set(encoded, forKey: key)
  }
  
  public static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}

