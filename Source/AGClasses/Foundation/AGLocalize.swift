//
//  AGLocalize.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - Localize
public extension String {
  
  //BaseOnSetting
  fileprivate func localizedSystem(table: String = "") -> String {
    var language = AGLocalizeManager.defaultLanguage
    var bundle = Bundle.main
    if let code = Locale.current.languageCode, AGLocalizeManager.availableLanguages().contains(code) {
      language = code
    }
    guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
      return self
    }
    if let bd = Bundle(path: path) {
      bundle = bd
    }
    return NSLocalizedString(self, tableName: table, bundle: bundle, value: "", comment: "")
  }
  
  //BaseOnApp
  fileprivate func localizedApp(table: String = "") -> String {
    let bundle = Bundle.main
    if let path = bundle.path(forResource: AGLocalizeManager.currentLanguage(), ofType: "lproj"), let bundle = Bundle(path: path) {
      return bundle.localizedString(forKey: self, value: nil, table: table)
    } else if let path = bundle.path(forResource: AGLocalizeManager.bundle, ofType: "lproj"), let bundle = Bundle(path: path) {
      return bundle.localizedString(forKey: self, value: nil, table: table)
    }
    return self
  }
  
}



//MARK: - Localize with arguments
public extension String {
  
  //BaseOnSetting
  fileprivate func localizedFormatSystem(_ arguments: [CVarArg], table: String = "") -> String {
    return String(format: localizedSystem(table: table), arguments: arguments)
  }
  
  //BaseOnApp
  fileprivate func localizedFormatApp(_ arguments: CVarArg..., table: String = "") -> String {
    return String(format: localizedApp(table: table), arguments: arguments)
  }
  
}



//MARK: - Localize with static function
public struct AGLocalize {
  
  public static func localized(_ string: String) -> String {
    var result = ""
    if AGLocalizeManager.shared.isLocalizedSystem {
      result = string.localizedSystem()
    } else {
      result = string.localizedApp()
    }
    guard !result.isEmpty else {
      assertionFailure("not fount localized for string: \(string)")
      return result
    }
    return result
  }
  
}



//MARK: - Localizable with enum
public protocol AGLocalizable {
  var table: String { get }
  init(raw: String)
}



//MARK: - Core function
public extension AGLocalizable where Self: RawRepresentable, Self.RawValue == String {
  
  public var localized: String {
    return rawValue.localizedApp(table: table)
  }
  
  public func localized(replace: String = "") -> String {
    if rawValue == "" {
      return replace
    } else {
      return localized
    }
  }
  
  public func localizedFormat(_ args: [CVarArg], replace: String = "") -> String {
    if rawValue == "" {
      return replace
    } else {
      //BaseOnSetting
      return rawValue.localizedFormatSystem(args, table: table)
      //BaseOnApp
      //    return rawValue.localizedFormatApp(args, table: table)
    }
  }

}

