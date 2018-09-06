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



//MARK: - Main
class AGOperationStatus: AGModelHelper {
  
  var _status: Bool?
  var _code: Int?
  var _description: String?
  var _error: String?
  var _http_code: Int?
  
  init() {
  }
  
  init(status: Bool,
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
  
  init?(json: JSON?) {
    guard let json = json else { return }
    self._status = json[Key.status].bool
    self._code = json[Key.code].int
    self._description = json[Key.description].string
    self._error = json[Key.error].string
    self._http_code = json[Key.http_code].int
  }
  
}



//MARK: - Key
extension AGOperationStatus {
  
  enum Key {
    static var status = "status"
    static var code = "code"
    static var description = "description"
    static var error = "error"
    static var http_code = "http_code"
  }
  
}



//MARK: - Getter
extension AGOperationStatus {
  
  var status: Bool {
    return _status ?? false
  }
  var code: Int {
    return _code ?? 0
  }
  var description: String {
    return _description ?? ""
  }
  var error: String {
    return _error ?? ""
  }
  var http_code: Int {
    return _http_code ?? 0
  }
  var getJson: JSON {
    let json: JSON = [
      Key.status : status,
      Key.code : code,
      Key.description : description,
      Key.error : error,
      Key.http_code : http_code
    ]
    return json
  }
  
}



//MARK: - Utils
extension AGOperationStatus {

}

