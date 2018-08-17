//
//  Error+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: Checker
public extension Error {
  
  public var isTimedOut: Bool {
    return self._code == NSURLErrorTimedOut
  }
  
}
