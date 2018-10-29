//
//  AGTextFieldDelegate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVCTextFieldDependency
public protocol AGVCTextFieldDependency: class {
  func keyboardToolbarDoneBarButtonPressed(_ sender: UITextField)
  func agTextField(_ text: String?, replace string: String, with range: NSRange) -> (current: String, update: String)?
  
}



//MARK: Implements - AGVC
public extension AGVC {
  
  @objc
  public func keyboardToolbarDoneBarButtonPressed(_ sender: UITextField) {
    sender.resignFirstResponder()
  }
  
}



//MARK: - Implement
public extension AGVCTextFieldDependency {
  
  public func agTextField(_ text: String?, replace string: String, with range: NSRange) -> (current: String, update: String)? {
    guard let str_current = text, let str_range = Range(range, in: str_current) else { return nil }
    let str_update = str_current.replacingCharacters(in: str_range, with: string)
    return (current: str_current, update: str_update)
  }
}



//MARK: - Common function
public extension AGVCTextFieldDependency {
  
}


