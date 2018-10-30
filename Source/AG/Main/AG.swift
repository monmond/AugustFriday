//
//  AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 28/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import UIKit



//MARK: - AG
public class AG {

  //MARK: - App
  public enum App {
    static let name = "AugustFriday"
  }
  
  
  
  //MARK: - Configuration
  class Configuration {
    static let shared = Configuration()
    var theme: AGColorTheme.Type = AG.C.Light.self
  }

}
