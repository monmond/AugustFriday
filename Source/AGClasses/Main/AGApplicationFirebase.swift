//
//  AGApplicationFirebase.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import Firebase



//MARK: - AGApplicationFirebase
public protocol AGApplicationFirebase {
  
}



//MARK: - Implements
public extension AGApplicationFirebase {
  
  public func setupFirebase() {
    FirebaseConfiguration.shared.setLoggerLevel(.min)
    FirebaseApp.configure()
    
  }
  
}



//MARK: - Common functions
public extension AGApplicationFirebase {

}
