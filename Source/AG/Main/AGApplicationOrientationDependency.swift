//
//  AGApplicationOrientationDependency.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 11/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGApplicationOrientationDependency
public protocol AGApplicationOrientationDependency {
  var applicationOrientationOrientation: UIInterfaceOrientationMask { get }
  var applicationOrientationIsLandscape: Bool { get }
  var applicationOrientationIsPortrait: Bool { get }
  func applicationOrientationChange(with orientations: AGApplicationOrientationChange)
}



//MARK: - Implements
public extension AGApplicationOrientationDependency {
  
  private var manager_applicationOrientation: AGApplicationOrientationManager {
    return AGApplicationOrientationManager.shared
  }
  
  public var applicationOrientationOrientation: UIInterfaceOrientationMask {
    return manager_applicationOrientation.orientation
  }
  
  public var applicationOrientationIsLandscape: Bool {
    return manager_applicationOrientation.isLandscape
  }
  
  public var applicationOrientationIsPortrait: Bool {
    return manager_applicationOrientation.isPortrait
  }
  
  public func applicationOrientationChange(with orientations: AGApplicationOrientationChange) {
    manager_applicationOrientation.change(with: orientations)
  }
  
}
