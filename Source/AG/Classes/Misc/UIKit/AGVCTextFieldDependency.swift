//
//  AGTextFieldDelegate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public protocol AGVCTextFieldDependency: class {
  
  func keyboardToolbarDoneBarButtonPressed(_ sender: UITextField)
  func textFieldDidChange(_ textField: UITextField)
  
}



//MARK: - Implements - UIViewController
public extension UIViewController {
  
  //  @objc
  //  open func keyboardToolbarDoneBarButtonPressed(_ sender: UITextField) {
  //    sender.resignFirstResponder()
  //  }
  //
  //  @objc
  //  open func textFieldDidChange(_ textField: UITextField) {
  //
  //  }
  
}



//MARK: - Implement
public extension AGVCTextFieldDependency {
  
}



//MARK: - Commons
public extension AGVCTextFieldDependency {
  
}


