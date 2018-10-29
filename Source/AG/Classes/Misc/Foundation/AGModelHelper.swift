//
//  AGModelHelper.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGModelHelper
public protocol AGModelHelper {
  
}



//MARK: - Implements
public extension AGModelHelper {
  
  public var description: String {
    var description = ""
    let mirror = Mirror(reflecting: self)
    for m in mirror.children {
      if let p = m.label {
        description += "\(p): \(m.value)\n"
      }
    }
    return description
  }
  
}
