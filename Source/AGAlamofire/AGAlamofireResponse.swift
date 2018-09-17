//
//  AFResponse.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGAlamofireResponse
public class AGAlamofireResponse<T> {
  
  public var data: T?
  public var error: AGError?
  
  public init(data: T?,error: AGError?) {
    self.data = data
    self.error = error
  }
  
  public var result: AGAlamofireResponseResult<T> {
    if let error = error {
      return .failure(error)
    }
    guard let data = data else {
      return .failure(error ?? .responseDataNotValid)
    }
    return .success(data)
  }
  
}


