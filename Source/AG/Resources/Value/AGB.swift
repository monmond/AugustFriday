//
//  AGB.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Button
public extension AG {
  
  public enum B {
    
    public enum Text { }
    
    public enum Plain { }
    
    public enum Popup { }
    
    public enum Border { }
    
    public enum BorderLess { }
    
    public enum Toggle { }
    
    public enum Icon { }
    
    public enum IconText { }
    
    public enum TextIcon { }
    
  }
  
}



//MARK: - Text
extension AG.B.Text {
  
  public struct Base: AGButtonSetting {
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
  }
  
}



//MARK: - Plain
extension AG.B.Plain {
  
}



//MARK: - Popup
extension AG.B.Popup {
  
  struct Confirm: AGButtonSetting {
    var appearance = AGButtonAppearance()
    var option = AGButtonOption()
    var color = AGButtonColor()
    var icon = UIImage()
    init() {
      appearance.lb_font = AG.F.System.font(with: .body)
      option.isSetupTitle = true
      option.isSetupBackground = true
      option.isSetupRadius = false
      color.lb = (normal: AG.C.white, highlighted: AG.C.white, disable: AG.C.white)
      color.bg = (normal: AG.C.red, highlighted: AG.C.grayLight, disable: AG.C.grayLight)
    }
  }
  
  struct Cancel: AGButtonSetting {
    var appearance = AGButtonAppearance()
    var option = AGButtonOption()
    var color = AGButtonColor()
    var icon = UIImage()
    init() {
      appearance.lb_font = AG.F.System.font(with: .body)
      option.isSetupTitle = true
      option.isSetupBackground = true
      option.isSetupRadius = false
      color.lb = (normal: AG.C.black, highlighted: AG.C.nickel, disable: AG.C.white)
      color.bg = (normal: AG.C.nickel, highlighted: AG.C.nickel, disable: AG.C.tungsten)
    }
  }
  
}



//MARK: - Border
extension AG.B.Border {
  
}



//MARK: - BorderLess
extension AG.B.BorderLess {
  
}



//MARK: - Toggle
extension AG.B.Toggle {
  
}



//MARK: - Icon
extension AG.B.Icon {
  
}



//MARK: - IconText
extension AG.B.IconText {
  
}



//MARK: - TextIcon
extension AG.B.TextIcon {
  
}






