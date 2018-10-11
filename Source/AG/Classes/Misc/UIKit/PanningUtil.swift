//
//  PanningUtil.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - PanningUtil
public protocol PanningUtil {
  
}



//MARK: - Implements
public extension PanningUtil {
  
  public func panningLocationRounded(with location: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat {
    var rounded = location
    if location <= min { rounded = min } else if location > max { rounded = max }
    return rounded
  }
  
  public func panningLocationPercent(with location: CGFloat, min: CGFloat, max: CGFloat, power: Int) -> CGFloat {
    let roundedBy = pow(10, CGFloat(power))
    var percent = ((location - min) / (max - min) * roundedBy) / roundedBy
    if percent < 0.0 { percent = 0.0 } else if percent > 1.0 { percent = 1.0 }
    return percent
  }
  
}
