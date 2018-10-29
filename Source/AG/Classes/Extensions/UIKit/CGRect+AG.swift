//
//  CGRect+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//
//  Credit by Alaeddine M. on 11/1/15.



//MARK: - Imports
import UIKit



//MARK: - Getter
public extension CGRect {
  
  public var x: CGFloat {
    get {
      return self.origin.x
    }
    set {
      self = CGRect(x: newValue, y: self.y, width: self.width, height: self.height)
    }
  }
  
  public var y: CGFloat {
    get {
      return self.origin.y
    }
    set {
      self = CGRect(x: self.x, y: newValue, width: self.width, height: self.height)
    }
  }
  
  
  public var width: CGFloat {
    get {
      return self.size.width
    }
    set {
      self = CGRect(x: self.x, y: self.y, width: newValue, height: self.height)
    }
  }
  
  public var height: CGFloat {
    get {
      return self.size.height
    }
    set {
      self = CGRect(x: self.x, y: self.y, width: self.width, height: newValue)
    }
  }
  
  
  public var top: CGFloat {
    get {
      return self.origin.y
    }
    set {
      y = newValue
    }
  }
  
  public var bottom: CGFloat {
    get {
      return self.origin.y + self.size.height
    }
    set {
      self = CGRect(x: x, y: newValue - height, width: width, height: height)
    }
  }
  
  public var left: CGFloat {
    get {
      return self.origin.x
    }
    set {
      self.x = newValue
    }
  }
  
  public var right: CGFloat {
    get {
      return x + width
    }
    set {
      self = CGRect(x: newValue - width, y: y, width: width, height: height)
    }
  }
  
  
  public var midX: CGFloat {
    get {
      return self.x + self.width / 2
    }
    set {
      self = CGRect(x: newValue - width / 2, y: y, width: width, height: height)
    }
  }
  
  public var midY: CGFloat {
    get {
      return self.y + self.height / 2
    }
    set {
      self = CGRect(x: x, y: newValue - height / 2, width: width, height: height)
    }
  }
  
  public var center: CGPoint {
    get {
      return CGPoint(x: self.midX, y: self.midY)
    }
    set {
      self = CGRect(x: newValue.x - width / 2, y: newValue.y - height / 2, width: width, height: height)
    }
  }
  
}

