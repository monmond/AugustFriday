//
//  AGRouter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Alamofire
import SwiftyJSON



//MARK: - Imports
public protocol AGRouter {
  
  var baseURL: String { get }
  var apiGroup: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var trailParam: String { get }
  
  var encoding: ParameterEncoding { get }
  var content_type: String { get }
  var header: [String: String] { get }
  var theURLRequest: URLRequest { get }
  
}



//MARK: - Implements
public extension AGRouter {
  
  public var encoding: ParameterEncoding {
    switch method {
    case .get, .delete:
      return URLEncoding.default
    case .post, .put:
      return JSONEncoding.default
    default:
      return URLEncoding.default
    }
  }
  
  var content_type: String {
    return "application/json"
  }

  public var trailParam: String {
    return ""
  }
  
  var header: [String: String] {
    let header = [
      "Content-Type" : content_type
    ]
    return header
  }
  
  public var theURLRequest: URLRequest {
    let url = URL(string:"\(baseURL)\(apiGroup)\(path)\(trailParam)")!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    for h in header {
      urlRequest.setValue(h.value, forHTTPHeaderField: h.key)
    }
    return urlRequest
  }

}



