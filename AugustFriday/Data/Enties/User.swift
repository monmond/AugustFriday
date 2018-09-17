//
//  User.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Firebase
import FirebaseDatabase



enum Gender: String {
  case male
  case female
}

//MARK: - User

class User: AGModelHelper {
  
  static let path = "user"
  
  var _ref: DatabaseReference?
  var _id: String?
  var _name: String?
  var _gender: Gender?
  var _age: Int?
  var _height: Float?
  var _weight: Float?
  
  //MARK: Relate
  var _pets: [Pet]
  
  init() {
    _ref = nil
    _id = ""
    _name = ""
    _gender = .male
    _age = 0
    _height = 0.0
    _weight = 0.0
    _pets = []
    
  }
  
  init?(snapshot: DataSnapshot) {
    guard let dict = snapshot.value as? [String: Any] else { return nil }
    _ref = snapshot.ref
    _id = dict[Key.id] as? String
    _name = dict[Key.name] as? String
    _gender = Gender(rawValue: (dict[Key.gender] as? String) ?? "")
    _age = dict[Key.age] as? Int
    _height = dict[Key.height] as? Float
    _weight = dict[Key.weight] as? Float
    _pets = []
    
  }
  
}



//MARK: - Key
extension User {
  
  enum Key {
    static let id = "id"
    static let name = "name"
    static let gender = "gender"
    static let age = "age"
    static let height = "height"
    static let weight = "weight"
    
  }
  
}



//MARK: - Getter
extension User {
  
  var id: String {
    return _id ?? ""
  }
  var name: String {
    return _name ?? ""
  }
  var gender: Gender {
    return _gender ?? .male
  }
  var age: Int {
    return _age ?? 0
  }
  var height: Float {
    return _height ?? 0.0
  }
  var weight: Float {
    return _weight ?? 0.0
  }
  var pets: [Pet] {
    return _pets
  }
  var toAny: Any {
    return [
      Key.id: id,
      Key.name: name,
      Key.age: age,
      Key.gender: gender.rawValue,
      Key.height: height,
      Key.weight: weight,
    ]
  }
  
}



//MARK: - Helper
extension User {
  
  class Array {
    var _users: [User] = []
    
    init?(snapshot: DataSnapshot) {
      guard let ss_array = snapshot.children.allObjects as? [DataSnapshot] else { return nil }
      _users = ss_array.compactMap({ User(snapshot: $0) })
      
    }
  }
  
}




