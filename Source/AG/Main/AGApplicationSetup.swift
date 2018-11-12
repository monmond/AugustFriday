//
//  AGApplicationSetup.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGApplicationSetup
public protocol AGApplicationSetup {
  
  func setupOnInit()
  func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?)
  func setupOnDeinit()
  
}



//MARK: - Implements
public extension AGApplicationSetup {
  
  public func setupOnInit() {
    
  }
  
  public func setupOnDidFinishLaunching(with app: UIApplication, options: [UIApplication.LaunchOptionsKey: Any]?) {
    setupNavigationBar()
    
  }
  
  public func setupOnDeinit() {
    
  }
  
}



//MARK: - Commons
public extension AGApplicationSetup {

  private func logFontFamilyNames() {
    for family in UIFont.familyNames.sorted() {
      print("Family: \(family)")
      for name in UIFont.fontNames(forFamilyName: family) {
        print("Font name: \(name)")
      }
    }
  }
  
  
  private func checkUpdateAvailable() {
    //    let id = Bundle.main.bundleId
    //    guard let url_lookup = URL(string: "http://itunes.apple.com/lookup?bundleId=\(id)") else { return }
    //    guard let data = try? Data(contentsOf: url_lookup) else { return }
    //    guard let optional = try? JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String: Any] else { return }
    //    guard let json = optional, let result = (json["results"] as? [Any])?.first as? [String: Any] else { return }
    //    guard let version = result["version"] as? String else { return }
    //    guard version != Bundle.main.versionNumber else { return }
    //    print("app store", version)
    //    print("installed", Bundle.main.versionNumber)
    //    guard let url_app = URL(string: "https://itunes.apple.com/us/app/apple-store/id375380948?mt=8") else { return }
    //    guard UIApplication.shared.canOpenURL(url_app) else { return }
    //    UIApplication.shared.open(url_app, options: [:]) {
    //      if $0 {
    //        print("1")
    //      }
    //    }
  }
  
  
}



//MARK: - Core Setups
public extension AGApplicationSetup {
  
  private func setupNavigationBar() {
    let nb = UINavigationBar.appearance()
    nb.barStyle = .default
    nb.setBackgroundImage(UIImage(), for: .default)
    nb.isTranslucent = true
    nb.backgroundColor = .clear
    nb.shadowImage = UIImage()
    
  }
  
}

