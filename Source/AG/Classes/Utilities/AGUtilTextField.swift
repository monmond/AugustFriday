//
//  AG.UtilTextField.swift
//  AugustFriday
//
//  Created by Sasawat Sankosik on 6/12/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import UIKit



public typealias AGTextFieldRequest = (text: String?, replace: String, range: NSRange)
public typealias AGTextFieldResponse = (current: String, update: String)
public typealias LDTextFieldDidChange = (UITextField) -> ()



public extension AG.Util.TextField {
  
}



public protocol AGUtilTextField {
  static func textField(with request: AGTextFieldRequest) -> AGTextFieldResponse?
}



extension AGUtilTextField {

  public static func textField(with request: AGTextFieldRequest) -> AGTextFieldResponse? {
    guard let str_current = request.text, let str_range = Range(request.range, in: str_current) else { return nil }
    let str_update = str_current.replacingCharacters(in: str_range, with: request.replace)
    return (current: str_current, update: str_update)
  }
  
}


