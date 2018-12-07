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
public extension AG.Cons.Button{
  
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



//MARK: - Text
extension AG.Cons.Button.Text {
  
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
extension AG.Cons.Button.Plain {
  
}



//MARK: - Popup
extension AG.Cons.Button.Popup {
  
  struct Confirm: AGButtonSetting {
    var appearance = AGButtonAppearance()
    var option = AGButtonOption()
    var color = AGButtonColor()
    var icon = UIImage()
    init() {
      appearance.lb_font = AG.Cons.Font.System.font(with: .body)
      option.isSetupTitle = true
      option.isSetupBackground = true
      option.isSetupRadius = false
      color.lb = (normal: AG.Cons.Color.white, highlighted: AG.Cons.Color.white, disable: AG.Cons.Color.white)
      color.bg = (normal: AG.Cons.Color.red, highlighted: AG.Cons.Color.grayLight, disable: AG.Cons.Color.grayLight)
    }
  }
  
  struct Cancel: AGButtonSetting {
    var appearance = AGButtonAppearance()
    var option = AGButtonOption()
    var color = AGButtonColor()
    var icon = UIImage()
    init() {
      appearance.lb_font = AG.Cons.Font.System.font(with: .body)
      option.isSetupTitle = true
      option.isSetupBackground = true
      option.isSetupRadius = false
      color.lb = (normal: AG.Cons.Color.black, highlighted: AG.Cons.Color.nickel, disable: AG.Cons.Color.white)
      color.bg = (normal: AG.Cons.Color.nickel, highlighted: AG.Cons.Color.nickel, disable: AG.Cons.Color.tungsten)
    }
  }
  
}



//MARK: - Border
extension AG.Cons.Button.Border {
  
}



//MARK: - BorderLess
extension AG.Cons.Button.BorderLess {
  
}



//MARK: - Toggle
extension AG.Cons.Button.Toggle {
  
}



//MARK: - Icon
extension AG.Cons.Button.Icon {
  
}



//MARK: - IconText
extension AG.Cons.Button.IconText {
  
}



//MARK: - TextIcon
extension AG.Cons.Button.TextIcon {
  
}






