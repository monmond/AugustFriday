//
//  ShadowSetting.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import UIKit



public protocol AGShadowable {
  
  var setting_shadow: AGShadowSetting { get set }
  func setupShadow()
  func settingShadow()
  
}



public struct AGShadowSetting {
  
  public var color: AGColor = BaseColor.gray_dark
  public var offset: CGSize = CGSize(width:0, height: 1.0)
  public var radius: CGFloat = 6.0
  public var opacity: Float = 0.3
  
}


