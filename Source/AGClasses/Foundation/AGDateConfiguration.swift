//
//  AGDateConfigure.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDateConfiguration
public class AGDateConfiguration {
  
  static let shared = AGDateConfiguration()
  public var format_using: [String] = AGDate.format_style + AGDate.format_default
  
}
