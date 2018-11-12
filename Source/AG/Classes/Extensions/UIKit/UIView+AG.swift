//
//  UIView+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Nib
public extension UIView {
  
  public class func fromNib<T: UIView>() -> T {
    return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
  }
  
}



//MARK: - Subview
public extension UIView {
  
  public func removeSubviewWithTag(_ tag: Int) {
    for sv in subviews {
      if sv.tag == tag {
        sv.removeFromSuperview()
        return
      }
    }
  }
  
  public func containSubviewWithTag(_ tag: Int) -> Bool {
    for sv in subviews {
      if sv.tag == tag {
        sv.removeFromSuperview()
        return true
      }
    }
    return false
  }
  
  public var recursiveSubviews: [UIView] {
    var subviews = self.subviews.compactMap({$0})
    subviews.forEach { subviews.append(contentsOf: $0.recursiveSubviews) }
    return subviews
  }
  
}



//MARK: - Rotation
public extension UIView {
  
  public func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
    let animation = CABasicAnimation(keyPath: "transform.rotation")
    animation.toValue = toValue
    animation.duration = duration
    animation.isRemovedOnCompletion = false
    animation.fillMode = CAMediaTimingFillMode.forwards
    self.layer.add(animation, forKey: nil)
  }
  
  public func animateRotation() {
    
    let rotation = CABasicAnimation(keyPath: "transform.rotation")
    rotation.fromValue = 0
    rotation.toValue = 2 * Double.pi
    rotation.duration = 1.1
    rotation.repeatCount = Float.infinity
    self.layer.add(rotation, forKey: "spin")
  }
  
}



//MARK: - SafeArea
extension UIView {
  
  var safeTopAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return self.safeAreaLayoutGuide.topAnchor
    } else {
      return self.topAnchor
    }
  }
  
  var safeLeftAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return self.safeAreaLayoutGuide.leftAnchor
    } else {
      return self.leftAnchor
    }
  }
  
  var safeRightAnchor: NSLayoutXAxisAnchor {
    if #available(iOS 11.0, *){
      return self.safeAreaLayoutGuide.rightAnchor
    } else {
      return self.rightAnchor
    }
  }
  
  var safeBottomAnchor: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return self.safeAreaLayoutGuide.bottomAnchor
    } else {
      return self.bottomAnchor
    }
  }
}

