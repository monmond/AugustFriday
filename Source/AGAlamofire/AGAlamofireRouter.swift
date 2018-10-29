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
public protocol AGAlamofireRouter {
  
  var host: String { get }
  var path: String { get }
  var path_last: String { get }
  var method: HTTPMethod { get }
  var path_param: String { get }
  
  var encoding: ParameterEncoding { get }
  var content_type: String { get }
  var header: [String: String] { get }
  var theURLRequest: URLRequest { get }
  
}



//MARK: - Implements
public extension AGAlamofireRouter {
  
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

  public var path_param: String {
    return ""
  }
  
  var header: [String: String] {
    let header = [
      "Content-Type" : content_type
    ]
    return header
  }
  
  public var theURLRequest: URLRequest {
    let url = URL(string:"\(host)\(path)\(path_last)\(path_param)")!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method.rawValue
    for h in header {
      urlRequest.setValue(h.value, forHTTPHeaderField: h.key)
    }
    return urlRequest
  }

}



