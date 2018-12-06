//
//  FirebaseViewWorker.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - imports
import Foundation
import Firebase
import FirebaseDatabase



//MARK: - FirebaseViewWorker
class FirebaseViewWorker {
  
  private let db = Database.database()
  
  private var u1: User {
    let u = User()
    u._id = ""
    u._name = "a"
    u._gender = .male
    u._age = 15
    u._height = 185.5
    u._weight = 70.5
    return u
  }
  
  private var u2: User {
    let u = User()
    u._id = ""
    u._name = "b"
    u._gender = .male
    u._age = 16
    u._height = 175
    u._weight = 60.5
    return u
  }
  
  private var u3: User {
    let u = User()
    u._id = ""
    u._name = "c"
    u._gender = .male
    u._age = 17
    u._height = 170
    u._weight = 55.5
    return u
  }
  
  private var u4: User {
    let u = User()
    u._id = ""
    u._name = "d"
    u._gender = .female
    u._age = 18
    u._height = 165
    u._weight = 47
    return u
  }
  
  private var u5: User {
    let u = User()
    u._id = ""
    u._name = "e"
    u._gender = .female
    u._age = 19
    u._height = 160
    u._weight = 45.5
    return u
  }
  
  private var users: [User] {
    return [u1, u2, u3, u4, u5]
  }
  
  private var p1: Pet {
    let p = Pet()
    p._id = ""
    p._name = "ก"
    p._type = .dog
    return p
  }
  
  private var p2: Pet {
    let p = Pet()
    p._id = ""
    p._name = "ข"
    p._type = .cat
    return p
  }
  
  private var p3: Pet {
    let p = Pet()
    p._id = ""
    p._name = "ค"
    p._type = .bird
    return p
  }
  
  private var pets: [Pet] {
    return [p1, p2, p3]
  }
  
  func fetchUser(onComplete: @escaping ((AGDataResponse<[User]>) -> ())) {
    let ref_user = db.reference(withPath: User.path)
    ref_user.observeSingleEvent(of: .value, andPreviousSiblingKeyWith: { snapshot, parent in
      var data: [User]?
      var error: AGError?
      let list = User.Array(snapshot: snapshot)?._users
      data = list
      error = nil
      onComplete(AGDataResponse<[User]>(data: data, error: error))
    }) {
      
      onComplete(AGDataResponse<[User]>(data: nil, error: .service((.notvalid, 0, $0.localizedDescription))))
    }
  }
  
  func fetchUserById(id: String, onComplete: @escaping ((AGDataResponse<User>) -> ())) {
    guard !id.isEmpty else {
      onComplete(AGDataResponse<User>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    let ref_user = db.reference(withPath: User.path)
    ref_user.child(id).observeSingleEvent(of: .value) {
      var data: User?
      var error: AGError?
      let item = User(snapshot: $0)
      data = item
      error = nil
      onComplete(AGDataResponse<User>(data: data, error: error))
    }
    
  }
  
  func insertUser(onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    let u = users[Int(arc4random_uniform(UInt32(users.count)))]
    let ref_user = db.reference(withPath: User.path)
    let key = ref_user.childByAutoId().key
    u._id = key
    ref_user.updateChildValues([key:u.toAny]) {
      var data: String?
      var error: AGError?
      data = $1.key
      if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
      onComplete?(AGDataResponse<String>(data: data, error: error))
    }
    
  }
  
  func updateUser(onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    fetchUser { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        guard !d.isEmpty else {
          onComplete?(AGDataResponse<String>(data: nil, error: .data((.empty, 0, ""))))
          return
        }
        let u = d[Int(arc4random_uniform(UInt32(d.count)))]
        AGLog.debug("pre")
        AGLog.debug(u.description)
        u._name = _s.users[Int(arc4random_uniform(UInt32(_s.users.count)))].name
        u._gender = _s.users[Int(arc4random_uniform(UInt32(_s.users.count)))].gender
        u._age = _s.users[Int(arc4random_uniform(UInt32(_s.users.count)))].age
        u._height = _s.users[Int(arc4random_uniform(UInt32(_s.users.count)))].height
        u._weight = _s.users[Int(arc4random_uniform(UInt32(_s.users.count)))].weight
        AGLog.debug("post")
        AGLog.debug(u.description)
        let ref_user = _s.db.reference(withPath: User.path)
        ref_user.updateChildValues([u.id: u.toAny]) {
          var data: String?
          var error: AGError?
          data = $1.key
          if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
          onComplete?(AGDataResponse<String>(data: data, error: error))
        }
        
      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        
      }
    }
  }
  
  func deleteUser(id: String, onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    guard !id.isEmpty else {
      onComplete?(AGDataResponse<String>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    fetchUserById(id: id) {
      switch $0.result {
      case let .success(d):
        AGLog.debug(d.description)
        d._ref?.removeValue { e, ref in
          let data = ref.key
          var error: AGError? = nil
          if let e = e { error = .service((.notvalid, 0, e.localizedDescription)) }
          onComplete?(AGDataResponse<String>(data: data, error: error))
        }
        
      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        
      }
    }
  }
  
  func fetchPet(onComplete: ((AGDataResponse<[Pet]>) -> ())? = nil) {
    let ref_pet = db.reference(withPath: Pet.path)
    ref_pet.observeSingleEvent(of: .value) { ref in
      let data = Pet.Array(snapshot: ref)?._pets
      let error: AGError? = nil
      onComplete?(AGDataResponse<[Pet]>(data: data, error: error))
    }
  }
  
  func fetchPetById(id: String, onComplete: @escaping ((AGDataResponse<Pet>) -> ())) {
    guard !id.isEmpty else {
      onComplete(AGDataResponse<Pet>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    let ref_user = db.reference(withPath: Pet.path)
    ref_user.child(id).observeSingleEvent(of: .value) { ref in
      let data = Pet(snapshot: ref)
      let error: AGError? = nil
      onComplete(AGDataResponse<Pet>(data: data, error: error))
    }
  }
  
  func insertPet(onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    let u = pets[Int(arc4random_uniform(UInt32(pets.count)))]
    let ref_pet = db.reference(withPath: Pet.path)
    let key = ref_pet.childByAutoId().key
    u._id = key
    ref_pet.updateChildValues([key:u.toAny]) { e, ref in
      let data = ref.key
      var error: AGError? = nil
      if let e = e { error = .service((.notvalid, 0, e.localizedDescription)) }
      onComplete?(AGDataResponse<String>(data: data, error: error))
    }
  
  }
  
  func updatePet(onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    fetchPet { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(d):
        guard !d.isEmpty else {
          onComplete?(AGDataResponse<String>(data: nil, error: .data((.empty, 0, ""))))
          return
        }
        let p = d[Int(arc4random_uniform(UInt32(d.count)))]
        AGLog.debug("pre")
        AGLog.debug(p.description)
        p._name = _s.pets[Int(arc4random_uniform(UInt32(_s.pets.count)))].name
        p._type = _s.pets[Int(arc4random_uniform(UInt32(_s.pets.count)))].type
        AGLog.debug("post")
        AGLog.debug(p.description)
        let ref_pet = _s.db.reference(withPath: Pet.path)
        ref_pet.updateChildValues([p.id: p.toAny]) {
          let data = $1.key
          var error: AGError?
          if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
          onComplete?(AGDataResponse<String>(data: data, error: error))
        }
        
      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        
      }
    }
  }
  
  func deletePet(id: String, onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    guard !id.isEmpty else {
      onComplete?(AGDataResponse<String>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    fetchUserById(id: id) {
      switch $0.result {
      case let .success(d):
        AGLog.debug(d.description)
        d._ref?.removeValue {
          let data = $1.key
          var error: AGError?
          if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
          onComplete?(AGDataResponse<String>(data: data, error: error))
        }
        
      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        
      }
    }
  }
  
  func fetchUserPet(id: String, onComplete: ((AGDataResponse<User>) -> ())? = nil) {
    guard !id.isEmpty else {
      onComplete?(AGDataResponse<User>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    let ref_userpet = db.reference(withPath: UserPet.path)
    fetchUserById(id: id) {
      switch $0.result {
      case let .success(d):
        ref_userpet.queryEqual(toValue: id).observeSingleEvent(of: .value, andPreviousSiblingKeyWith: { snapshot, parent in
          guard let list = Pet.Array(snapshot: snapshot) else {
            onComplete?(AGDataResponse<User>(data: nil, error: .service((.notvalid, 0, ""))))
            return
          }
          d._pets = list._pets
          onComplete?(AGDataResponse<User>(data: d, error: nil))
        }) { e in
          onComplete?(AGDataResponse<User>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        }
      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<User>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
      }
    }
  }
  
  func insertUserPet(userId: String, petId: String, onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    guard !userId.isEmpty && !petId.isEmpty  else {
      onComplete?(AGDataResponse<String>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    fetchUserById(id: userId) { [weak self] in
      guard let _s = self else { return }
      switch $0.result {
      case let .success(u):
        _s.fetchPetById(id: petId) {
          switch $0.result {
          case let .success(p):
//            let ref_user = db.reference(withPath: Pet.path)
//            u._pets[petId] = p.toAny
            u._ref?.child(Pet.path).updateChildValues([p.id: p.toAny]) {
              var data: String?
              var error: AGError?
              data = $1.key
              if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
              onComplete?(AGDataResponse<String>(data: data, error: error))
            }
            
          case let .failure(e):
            AGLog.debug(e)
            onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
            
          }
        }

      case let .failure(e):
        AGLog.debug(e)
        onComplete?(AGDataResponse<String>(data: nil, error: .service((.notvalid, 0, e.localizedDescription))))
        
      }
    }
  }
  
  func deleteUserPet(userId: String, petId: String, onComplete: ((AGDataResponse<String>) -> ())? = nil) {
    guard !userId.isEmpty && !petId.isEmpty  else {
      onComplete?(AGDataResponse<String>(data: nil, error: .data((.notvalid, 0, ""))))
      return
    }
    let ref_user = db.reference(withPath: User.path)
    ref_user.child("\(userId)/\(petId)").removeValue {
      var data: String?
      var error: AGError?
      data = $1.key
      if let e = $0 { error = .service((.notvalid, 0, e.localizedDescription)) }
      onComplete?(AGDataResponse<String>(data: data, error: error))
    }
  }
  
}
