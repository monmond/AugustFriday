//
//  BaseFont.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import Foundation

enum BaseFont: String, AGFont {
  var name: String {
    return "Helvetica"
  }
  case regular = ""
  case lightIt
  case boldIt
  case lightItalic
  case ultraLiIt
  case bold
  case light
  case boldItalic
  case ultraLi
  case ultraLight
  case italic
  case ultraLightItalic
}
