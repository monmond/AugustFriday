//
//  UIButton+AGButton.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 20/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - UIButton+AGButton
public extension UIButton {
  
  public func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
    let img = UIImage.imageWithColor(color: color)
    self.setBackgroundImage(img, for: state)
  }
  
}
