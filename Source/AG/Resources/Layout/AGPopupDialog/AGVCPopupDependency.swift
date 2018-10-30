//
//  AGVCPopupDependency.swift
//  atimemedia
//
//  Created by sasawat sankosik on 24/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog



//MARK: - AGVCPopupDependency
public protocol AGVCPopupDependency {
  
}



//MARK: - Implements
public extension AGVCPopupDependency {
  
}



//MARK: - Commons
public extension AGVCPopupDependency {
  
  public func popup(with priority: AGPopupPriority) -> Bool {
    guard AGPopupManager.shared.isHigher(with: priority) else { return false }
    AGPopupManager.shared.setPriority(with: priority)
    return true
  }
  
  public func present(with popup: PopupDialog,
               priority: AGPopupPriority,
               on: UIViewController?,
               onPresented: CBVoid? = nil) {
    if let on = on {
      on.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
    } else if let vc_top = UIViewController.top {
      vc_top.present(popup, animated: true) {
        if let onPresented = onPresented {
          onPresented()
        }
      }
    }
  }
  
  public func dismissed(with priority: AGPopupPriority) {
    guard AGPopupManager.shared.isHigher(with: priority) else { return }
    AGPopupManager.shared.setPriority(with: .common)
  }
  
}

