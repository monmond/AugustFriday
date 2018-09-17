//
//  FirebaseViewConfiguration.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 14/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - FirebaseViewConfiguration
class FirebaseViewConfiguration {
  
  static let shared = FirebaseViewConfiguration()
  private init () { }
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var id_user = ""
  var id_pet = ""
  
//  static var id_user = "-LMIbdB8nKDxevBoJDQQ"
//  static var id_pet1 = "-LMIqoCp2y43UZcfEUeP"
//  static var id_pet2 = "-LMIqrvRAq3g3QJrSACN"
  
}



//MARK: - FirebaseViewConfigurationDependency
protocol FirebaseViewConfigurationDependency {
  
}


//MARK: - Private
extension FirebaseViewConfigurationDependency {
  
  private var config_firebaseView: FirebaseViewConfiguration {
    return FirebaseViewConfiguration.shared
  }
  
}


//MARK: - Public
extension FirebaseViewConfigurationDependency {
  
  func setUserId(id: String) {
    config_firebaseView.id_user = id
  }
  
  func setPetId(id: String) {
    config_firebaseView.id_pet = id
  }
  
  func getUserId() -> String {
    return config_firebaseView.id_user
  }
  
  func getPetId() -> String {
    return config_firebaseView.id_pet
  }
  
}
