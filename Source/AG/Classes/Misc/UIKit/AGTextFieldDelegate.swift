//
//  AGTextFieldDelegate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGTextFieldDelegate
public protocol AGTextFieldDelegate {
  func agTextField(_ text: String?, replace string: String, with range: NSRange) -> (current: String, update: String)?
}



//MARK: - Implement
public extension AGTextFieldDelegate {
  
  public func agTextField(_ text: String?, replace string: String, with range: NSRange) -> (current: String, update: String)? {
    guard let str_current = text, let str_range = Range(range, in: str_current) else { return nil }
    let str_update = str_current.replacingCharacters(in: str_range, with: string)
    return (current: str_current, update: str_update)
  }
}



//MARK: - Common function
public extension AGTextFieldDelegate {
  
}


