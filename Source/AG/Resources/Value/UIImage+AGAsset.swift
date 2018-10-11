//
//  UIImage+AGAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public extension UIImage {
  
  public func overlay(color: UIColor) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
    let context = UIGraphicsGetCurrentContext()
    color.setFill()
    context?.translateBy(x: 0, y: self.size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    context?.setBlendMode(CGBlendMode.colorBurn)
    let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
    guard let cgImage = self.cgImage else {
      return nil
    }
    context?.draw(cgImage, in: rect)
    context?.setBlendMode(CGBlendMode.sourceIn)
    context?.addRect(rect)
    context?.drawPath(using: CGPathDrawingMode.fill)
    let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return coloredImage
  }
  
}
