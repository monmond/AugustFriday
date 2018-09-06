//
//  AGLogConfiguration.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGLogManager
public class AGLogConfiguration {
  
  public static let shared = AGLogConfiguration()
  
  public var logLevel: AGLogLevel = .debug
  
}
