//
//  Int+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - Converter
public extension Int {
  
  public var toString: String {
    return "\(self)"
  }
  
}



public extension Int {
  
  public var toIndexSet: IndexSet {
    return IndexSet(integer: self)
  }
  
}
