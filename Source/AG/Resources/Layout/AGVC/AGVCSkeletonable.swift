//
//  AGVCSkeletonable.swift
//  atimemedia
//
//  Created by sasawat sankosik on 12/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - imports
import UIKit
import SkeletonView



//MARK: - AGVCSkeletonable
public protocol AGVCSkeletonable: class {
  
  func displayStartAnimatedSkeleton()
  func displayStopAnimatedSkeleton()
  
}



//MARK: - Implements
public extension AGVCSkeletonable where Self: UIViewController {
  
  public func displayStartAnimatedSkeleton() {
    DispatchQueue.main.async {
      self.view.showAnimatedSkeleton()
    }
  }
  
  public func displayStopAnimatedSkeleton() {
    view.hideSkeleton()
  }
  
}
