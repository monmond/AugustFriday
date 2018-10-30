//
//  AGApplicationOrientationManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Typealias
public typealias AGApplicationOrientationChange = (mask: UIInterfaceOrientationMask, rotateTo: UIInterfaceOrientation)



//MARK: - AGApplicationOrientationManager
public class AGApplicationOrientationManager {
  
  public static let shared = AGApplicationOrientationManager()
  
  var orientation: UIInterfaceOrientationMask = .portrait
  
  var isLandscape: Bool {
    let sb_orientation = UIApplication.shared.statusBarOrientation
    let device_orientation = UIDevice.current.orientation
    return device_orientation.isValidInterfaceOrientation ? device_orientation.isLandscape : sb_orientation.isLandscape
  }
  var isPortrait: Bool {
    let sb_orientation = UIApplication.shared.statusBarOrientation
    let device_orientation = UIDevice.current.orientation
    return device_orientation.isValidInterfaceOrientation ? device_orientation.isPortrait : sb_orientation.isPortrait
  }
  
  func change(with orientations: AGApplicationOrientationChange) {
    self.orientation = orientations.mask
    UIDevice.current.setValue(orientations.rotateTo.rawValue, forKey: "orientation")
  }
  
}
