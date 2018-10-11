//
//  FadeTransition.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//
//  Credit by Alaeddine M. on 11/1/15.



//MARK: - Imports
import UIKit



//MARK: - AGFadeTransition
open class AGFadeTransition: NSObject, UIViewControllerAnimatedTransitioning {
  
  public var transitionDuration: TimeInterval = 0.5
  public var startingAlpha: CGFloat = 0.0
  
  public convenience init(transitionDuration: TimeInterval, startingAlpha: CGFloat){
    self.init()
    self.transitionDuration = transitionDuration
    self.startingAlpha = startingAlpha
  }
  
  open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return transitionDuration
  }
  
  open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    
    let toView   = transitionContext.view(forKey: .to)!
    let fromView = transitionContext.view(forKey: .from)!
    
    toView.alpha   = startingAlpha
    fromView.alpha = 0.8
    
    toView.frame = containerView.frame
    containerView.addSubview(toView)
    
    UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { () -> Void in
      toView.alpha   = 1.0
      fromView.alpha = 0.0
    }, completion: { _ in
      fromView.alpha = 1.0
      transitionContext.completeTransition(true)
    })
  }
  
}
