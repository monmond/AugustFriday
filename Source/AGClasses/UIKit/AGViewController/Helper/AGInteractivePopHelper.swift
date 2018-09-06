//
//  AGInteractivePopHelper.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGInteractivePopHelper
public class AGInteractivePopHelper: NSObject {
  //MARK: - UI
  fileprivate var vc: UIViewController!
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  public init(vc: UIViewController) {
    super.init()
    self.vc = vc
    onInit()
  }
  
  deinit {
    onDeinit()
    
  }
}



//MARK: - Life Cycle
extension AGInteractivePopHelper {
  
  func onInit() {
    enableInteractivePopGestures()
  }
  
  func onDeinit() {
    
  }
  
  
}



//MARK: - Setup
extension AGInteractivePopHelper {
  
  func enableInteractivePopGestures() {
    vc.navigationController?.interactivePopGestureRecognizer?.delegate = self
    vc.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    
  }
  
  func disableInteractivePopGestures() {
    vc.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    vc.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    
  }
  
}



//MARK: - Public
public extension AGInteractivePopHelper {
  
}



//MARK: - Private
extension AGInteractivePopHelper {
  
}



//MARK: - UIGestureRecognizerDelegate
extension AGInteractivePopHelper: UIGestureRecognizerDelegate {
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    guard let tap = vc.navigationController?.interactivePopGestureRecognizer,
      tap == gestureRecognizer else {
        return false
    }
    let count = (vc.navigationController?.viewControllers.count) ?? 0
    return count > 1 ? true : false
  }
  
}
