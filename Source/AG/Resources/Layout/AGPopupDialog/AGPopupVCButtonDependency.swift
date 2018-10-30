//
//  AGPopupButtonDependency.swift
//  atimemedia
//
//  Created by sasawat sankosik on 24/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog



//MARK: - AGPopupButtonDependency
public protocol AGPopupVCButtonDependency {
  var flag_selected: Bool { get set }
  func cancelButtonPressed(_ sender: Any?)
  func okButtonPressed(_ sender: Any?)
}



//MARK: - Implements
public extension AGPopupVC {

  @objc
  public func cancelButtonPressed(_ sender: Any?) {
    flag_selected = false
    dismiss(animated: true, completion: nil)
  }
  
  @objc
  public func okButtonPressed(_ sender: Any?) {
    flag_selected = true
    dismiss(animated: true, completion: nil)
  }
  
}



//MARK: - Imports
public extension AGPopupVCButtonDependency where Self: AGPopupVC {
  
}



