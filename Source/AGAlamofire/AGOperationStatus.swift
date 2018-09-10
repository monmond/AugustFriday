//
//  AGOperationStatus.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//




//MARK: - Imports
import UIKit
import SwiftyJSON



//MARK: - Extensions
extension AGOperationStatus: AGModelHelper { }
extension AGOperationStatus: AGAlamofireValidatable { }



//MARK: - Main
public final class AGOperationStatus: Codable {
  
  enum CodingKeys: String, CodingKey {
    case _status = "status"
    case _code = "code"
    case _description = "description"
    case _error = "error"
    case _http_code = "http_code"
  }
  
  public var _status: Bool?
  public var _code: Int?
  public var _description: String?
  public var _error: String?
  public var _http_code: Int?
  
  public init() {
    
  }
  
  public init(status: Bool,
              code: Int,
              description: String,
              error: String,
              http_code: Int) {
    self._status = status
    self._code = code
    self._description = description
    self._error = error
    self._http_code = http_code
  }
  
  public init?(json: JSON?) {
    guard let json = json else { return }
    self._status = json[Key.status].bool
    self._code = json[Key.code].int
    self._description = json[Key.description].string
    self._error = json[Key.error].string
    self._http_code = json[Key.http_code].int
  }
  
}



//MARK: - Key
public extension AGOperationStatus {
  
  public enum Key {
    static var status = "status"
    static var code = "code"
    static var description = "description"
    static var error = "error"
    static var http_code = "http_code"
  }
  
}



//MARK: - Getter
public extension AGOperationStatus {
  
  public var status: Bool {
    return _status ?? false
  }
  public var code: Int {
    return _code ?? 0
  }
  public var description: String {
    return _description ?? ""
  }
  public var error: String {
    return _error ?? ""
  }
  public var http_code: Int {
    return _http_code ?? 0
  }
  public var getJson: JSON {
    let json: JSON = [
      Key.status: status,
      Key.code: code,
      Key.description: description,
      Key.error: error,
      Key.http_code: http_code
    ]
    return json
  }
  
}



//MARK: - Utils
public extension AGOperationStatus {
  
}

