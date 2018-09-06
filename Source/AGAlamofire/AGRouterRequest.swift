//
//  AGRouterRequest.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Alamofire



//MARK: - AGRouterRequest
public protocol AGRouterRequest {
  
  var toParam: Parameters { get }
  var toSegmentParam: String { get }
  var toTrailingParam: String { get }
  
}



//MARK: - Implements
public extension AGRouterRequest {
  
  public var toParam: Parameters {
    return Parameters()
  }
  
  public var toSegmentParam: String {
    guard !toParam.values.isEmpty else {
      return ""
    }
    let joined = toParam.values.map({ "\($0)" }).joined(separator: "/")
    return "/\(joined)"
  }
  
  public var toTrailingParam: String {
    return ""
  }
  
  public var toSegmentParamUnSlash: String {
    return toParam.values.map({ "\($0)" }).joined(separator: "")
  }
  
}



