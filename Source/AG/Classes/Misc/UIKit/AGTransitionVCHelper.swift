//
//  AGTransitionVCHelper.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension AGTransitionVCHelper: UIViewControllerTransitioningDelegate { }



//MARK: - AGTransitionVCHelper
public class AGTransitionVCHelper: NSObject {
  //MARK: - UI
  fileprivate weak var vc: UIViewController!
  
  
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
  
}



//MARK: - Life Cycle
extension AGTransitionVCHelper {
  
  public func onInit() {
    enableTransitioningDelegate()
  }
  
  public func onDeinit() {
    disableTransitioningDelegate()
  }
  
}



//MARK: - Setup
extension AGTransitionVCHelper {
  
  public func enableTransitioningDelegate() {
    vc.transitioningDelegate = self
    
  }
  
  public func disableTransitioningDelegate() {
    vc.transitioningDelegate = nil
    
  }
  
}



//MARK: - Public
public extension AGTransitionVCHelper {
  
}



//MARK: - Private
extension AGTransitionVCHelper {
  
}



//MARK: - UIViewControllerTransitioningDelegate
public extension AGTransitionVCHelper {
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return AGFadeTransition(transitionDuration: 5.5, startingAlpha: 0.8)
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return AGFadeTransition(transitionDuration: 5.5, startingAlpha: 0.8)
  }
  
}

