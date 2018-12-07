//
//  CATransition+AG.Cons.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 21/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import QuartzCore



//MARK: - Type
public extension CATransition {
  
  public enum Transition {
    case fade
    case push
  }
  
  public convenience init(transition: Transition) {
    self.init()
    duration = 0.3
    timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    switch transition {
    case .fade:
      type = CATransitionType.fade
    case .push:
      type = CATransitionType.push
    }
  }
  
}
