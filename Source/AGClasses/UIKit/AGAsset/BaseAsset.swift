//
//  BaseAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import Foundation

public enum BaseAsset: String, AGAsset {
  
  public var prefix: String {
    return "base_"
  }
  
  public var name: String {
    return rawValue
  }
  
  public init(raw: String) {
    self = BaseAsset(rawValue: raw) ?? .none
  }
  
  case none
  
}
