//
//  BaseButtonSetting.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - BaseButtonSetting
public struct BaseButtonSetting: AGButtonSetting {
  
  public var appearance: AGButtonAppearance = AGButtonAppearance()
  public var option: AGButtonOption = AGButtonOption()
  public var color: AGButtonColor = AGButtonColor()
  public var icon: UIImage = UIImage()
  
  public init() {
    appearance = AGButtonAppearance()
    option = AGButtonOption()
    color = AGButtonColor()
    icon = UIImage()
  }
  
  public init(appearance: AGButtonAppearance = AGButtonAppearance(),
              option: AGButtonOption = AGButtonOption(),
              color: AGButtonColor = AGButtonColor(),
              icon: UIImage = UIImage()) {
    self.appearance = appearance
    self.option = option
    self.color = color
    self.icon = icon
  }
  
}



/**
 AGButtonStyle
 white_border_rad_red_icon_bottom
 - white meaning text color is white
 - border meaning using border
 - radius meaning border is radius
 - icon meaning icon using style
 - bottom meaning only bottom border
 */
//MARK: - BaseButtonSetting
public enum BaseButtonStyle: AGButtonStyle {
  
  //Button
  case none
  case loadmore
  case refresh
  
  
  //Border
  
  
  //No Border
  
  
  //Toggle & Switch
  
  
  //Icon
  
  
  //IconText
  
  
  //textIcon
  
  
  //Text Only
  case txt_white
  
  
  public func getSetting() -> AGButtonSetting {
    
    var setting = BaseButtonSetting()
    switch self {
    case .none:
      setting = BaseButtonSetting()
    default:
      break
    }
    return setting
    
  }
  
  
}
