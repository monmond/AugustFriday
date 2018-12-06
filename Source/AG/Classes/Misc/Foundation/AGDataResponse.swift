//
//  AGDataResponse.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 12/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



public class AGDataResponse<T> {
  
  public var data: T?
  public var error: AGError?
  
  public init(data: T?,error: AGError?) {
    self.data = data
    self.error = error
  }
  
  public var result: AGDataResponseResult<T> {
    if let error = error {
      return .failure(error)
    }
    guard let data = data else {
      let info = AGErrorInfo(type: .notvalid, code: 0, message: "")
      return .failure(error ?? .service(info))
    }
    return .success(data)
  }
  
}


