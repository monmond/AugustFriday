//
//  AGError.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//




import UIKit



public typealias AGErrorInfo = (type: CommonError, code: Int, message: String?)
public let AGErrorInfoDefault: AGErrorInfo = (.none, 0, nil)



public enum CommonError: Error {
  case none
  case get
  case insert
  case update
  case delete
  case format
  case outofbound
  case notvalid
  case empty
  case notfound
  case cancelled
  case operationstatus
  case notsuccess
  case timedOut
  case reachability
}


public enum AGError: Error {
  case service(AGErrorInfo)
  case data(AGErrorInfo)
  case ui(AGErrorInfo)
  case user(AGErrorInfo)
  case social(AGErrorInfo)
  case other(AGErrorInfo)
}
