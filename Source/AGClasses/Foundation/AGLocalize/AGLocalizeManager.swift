//
//  AGLocalizeManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public class AGLocalizeManager {
  
  public static let shared = AGLocalizeManager()
  private init() { }
  
  public var isLocalizedSystem: Bool = true
  public static let currentLanguageKey = "CurrentLanguageKey"
  public static let defaultLanguage = "th"
  public static let bundle = "Base"
  
}



//MARK: Core function
public extension AGLocalizeManager {
  
  // get current Apple language
  public class func availableLanguages() -> [String] {
    var availableLanguages = Bundle.main.localizations
    // If excludeBase = true, don't include "Base" in available languages
    if let indexOfBase = availableLanguages.index(of: AGLocalizeManager.bundle) {
      availableLanguages.remove(at: indexOfBase)
    }
    return availableLanguages
  }
  
  public class func currentLanguage() -> String {
    if let currentLanguage = UserDefaults.standard.object(forKey: AGLocalizeManager.currentLanguageKey) as? String {
      return currentLanguage
    }
    return AGLocalizeManager.defaultLanguage
    
  }
  
  /// set @lang to be the first in Applelanguages list
  public class func setLanguage(_ language: String) {
    let selectedLanguage = availableLanguages().contains(language) ? language : currentLanguage()
    if (selectedLanguage != currentLanguage()){
      UserDefaults.standard.set(selectedLanguage, forKey: AGLocalizeManager.currentLanguageKey)
      UserDefaults.standard.synchronize()
    }
  }
  
  public class func getDefaultLanguage() -> String {
    var defaultLanguage: String = String()
    guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
      return AGLocalizeManager.currentLanguageKey
    }
    let availableLanguages: [String] = self.availableLanguages()
    if (availableLanguages.contains(preferredLanguage)) {
      defaultLanguage = preferredLanguage
    }
    else {
      defaultLanguage = AGLocalizeManager.defaultLanguage
    }
    return defaultLanguage
  }
  
  public class func resetLanguage() {
    setLanguage(getDefaultLanguage())
  }
  
}
