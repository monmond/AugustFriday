//
//  UIButton+AGButton.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 20/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

//MARK: - HILIGHT BACKGROUND
public extension UIButton {
  
  public func setBackgroundColor(_ color: UIColor, for state: UIControlState) {
    let img = UIImage.imageWithColor(color: color)
    self.setBackgroundImage(img, for: state)
  }
  
}
