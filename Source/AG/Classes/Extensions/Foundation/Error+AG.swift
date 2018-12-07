//
//  Error+AG.Cons.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - Checker
public extension Error {
  
  public var isTimedOut: Bool {
    return _code == NSURLErrorTimedOut
  }
  
  public var cancelled: Bool {
    return _code == NSURLErrorCancelled
  }
  
}
