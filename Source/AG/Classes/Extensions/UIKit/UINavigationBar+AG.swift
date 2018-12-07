//
//  UINavigationBar+AG.Cons.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: Background
public extension UINavigationBar {
  
  public func setBackgroundColor(_ color: UIColor, for barMetrics: UIBarMetrics) {
    setBackgroundImage(UIImage.color(with: color), for: barMetrics)
  }
  
}
