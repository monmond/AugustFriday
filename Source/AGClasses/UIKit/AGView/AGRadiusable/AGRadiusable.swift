//
//  RaduisSetting.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import UIKit



public protocol AGRadiusable {
  
  var setting_radius: AGRadiusSetting { get set }
  func setupRadius()
  func settingRadius()
  
}



public struct AGRadiusSetting {
  
  public var color: AGColor = BaseColor.clear
  public var radius: CGFloat = 6.0
  public var width: CGFloat = 0.0
  
}


