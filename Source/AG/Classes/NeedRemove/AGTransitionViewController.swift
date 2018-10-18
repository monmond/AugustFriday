//
//  AGTransitionViewController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//
//  Credit by Alaeddine M. on 11/1/15.



//MARK: - Imports
import UIKit



//MARK: - AGTransitionViewController
open class AGTransitionViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    self.transitioningDelegate = self
  }
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return AGFadeTransition(transitionDuration: 0.5, startingAlpha: 0.8)
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return AGFadeTransition(transitionDuration: 0.5, startingAlpha: 0.8)
  }
  
}

