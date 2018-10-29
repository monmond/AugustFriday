//
//  UIImage+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - UIImage+AG
public extension UIImage {
  
  public class func imageWithColor(color: UIColor) -> UIImage? {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
  
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
