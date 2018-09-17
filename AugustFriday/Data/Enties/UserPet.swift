//
//  UserPet.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Firebase
import FirebaseDatabase



//MARK: - UserPet
class UserPet: AGModelHelper {
  
  static let path = "user-pet"
  
  var _ref: DatabaseReference?
  var _id: String?
  var _userId: String?
  var _petId: String?
//  var _createdDate: String?
//  var _updatedDate: String?
  
  
  init() {
    _ref = nil
    _id = ""
    _userId = ""
    _petId = ""
//    _createdDate = ""
//    _updatedDate = ""
    
  }
  
  init?(snapshot: DataSnapshot) {
    guard let dict = snapshot.value as? [String: Any] else { return nil }
    _ref = snapshot.ref
    _id = dict[Key.id] as? String
    _userId = dict[Key.userId] as? String
    _petId = dict[Key.petId] as? String
//    _createdDate = dict[Key.createdDate] as? String
//    _updatedDate = dict[Key.updatedDate] as? String
    
  }
  
}



//MARK: - Key
extension UserPet {
  
  enum Key {
    static let id = "id"
    static let userId = "userId"
    static let petId = "petId"
//    static let createdDate =  "createdDate"
//    static let updatedDate =  "updatedDate"
    
  }
  
}



//MARK: - Getter
extension UserPet {
  
  var id: String {
    return _id ?? ""
  }
  var userId: String {
    return _userId ?? ""
  }
  var petId: String {
    return _petId ?? ""
  }
//  var createdDate: String {
//    return _createdDate ?? ""
//  }
//  var updatedDate: String {
//    return _updatedDate ?? ""
//  }
  var toAny: Any {
    return [
      Key.id: id,
      Key.userId: userId,
      Key.petId: petId
//      Key.createdDate: createdDate,
//      Key.updatedDate: updatedDate
    ]
  }
  
}



//MARK: - Helper
extension UserPet {
  
  class Array {
    var _userpets: [UserPet] = []
    
    init?(snapshot: DataSnapshot) {
      guard let ss_array = snapshot.children.allObjects as? [DataSnapshot] else { return nil }
      _userpets = ss_array.compactMap({ UserPet(snapshot: $0) })
      
    }
  }
  
}




