//
//  Dog.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 13/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Firebase
import FirebaseDatabase



enum Animal: String {
  case dog
  case cat
  case bird
}



//MARK: - Pet
class Pet: AGModelHelper {
  
  static let path = "pet"
  
  var _ref: DatabaseReference?
  var _id: String?
  var _name: String?
  var _type: Animal?
  
  init() {
    _ref = nil
    _id = ""
    _name = ""
    _type = .dog
    
  }
  
  init?(snapshot: DataSnapshot) {
    guard let dict = snapshot.value as? [String: Any] else { return nil }
    _ref = snapshot.ref
    _id = dict[Key.id] as? String
    _name = dict[Key.name] as? String
    _type = Animal(rawValue: (dict[Key.type] as? String) ?? "")
    
  }
  
}



//MARK: - Key
extension Pet {
  
  enum Key {
    static let id = "id"
    static let name = "name"
    static let type = "type"
    
  }
  
}



//MARK: - Getter
extension Pet {
  
  var id: String {
    return _id ?? ""
  }
  var name: String {
    return _name ?? ""
  }
  var type: Animal {
    return _type ?? .dog
  }
  var toAny: Any {
    return [
      Key.id: id,
      Key.name: name,
      Key.type: type.rawValue
    ]
  }
  
}



//MARK: - Helper
extension Pet {
  
  class Array {
    var _pets: [Pet] = []
    init?(snapshot: DataSnapshot) {
      guard let ss_array = snapshot.children.allObjects as? [DataSnapshot] else { return nil }
      _pets = ss_array.compactMap({ Pet(snapshot: $0) })
      
    }
  }
  
}




