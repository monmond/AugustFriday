//
//  BaseAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - BaseAsset
public enum BaseAsset: String, AGAsset {
  
  public var bundle: Bundle? {
    return Bundle(identifier: Bundle.main.bundleIdentifier!)
  }
  
  public var name: String {
    return rawValue
  }
  
  public init(raw: String) {
    self = BaseAsset(rawValue: raw) ?? .none
  }
  
  case none
  
}
