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


//MARK: - AGDefaultsFoundation
protocol AGDefaultsFoundation {
  associatedtype T
  static var key: String { get }
  static func get() -> T?
  static func set(data: T)
  static func remove()
}



//MARK: - Implements
extension AGDefaultsFoundation {
  
  static func get() -> T? {
    let ud = UserDefaults.standard
    return ud.object(forKey: key) as? T
  }
  
  static func set(data: T) {
    let ud = UserDefaults.standard
    ud.set(data, forKey: key)
  }
  
  static func remove() {
    let ud = UserDefaults.standard
    ud.removeObject(forKey: key)
  }
  
}



//MARK: - AGDefaults
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

