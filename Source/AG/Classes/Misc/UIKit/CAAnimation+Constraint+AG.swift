//
//  AGBasicAnimation.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

//public let kCATransformRotation = "transform.rotation"
//public let kCASpin = "spin"
//public let kCAKeyPositon = "position"

 
public struct CAAnimation {
 
}

public extension CAAnimation {
  
  public struct Transition {
    
    public struct Key {
      
      public static var spin = "spin"
      
    }
    
  }
  
}

public extension CAAnimation {

  public struct Basic {
    
    public struct Transform {
      
      public static var rotation = CABasicAnimation(keyPath: "transform.rotation")
      public static var scale = CABasicAnimation(keyPath: "transform.scale")
      
    }
    
    public struct Size {
      
      public static var width = CABasicAnimation(keyPath: "bounds.size.width")
      
    }
    
  }
  
}

public extension CAAnimation {

  public struct KeyFrame {
    
    public static var position = CAKeyframeAnimation(keyPath: "position")
    
  }
  
}
