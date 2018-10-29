//
//  ShadowSetting.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGShadowModel
public struct AGShadowModel {
  public var color: UIColor = UIColor.darkGray
  public var offset: CGSize = CGSize(width:0, height: 1.0)
  public var radius: CGFloat = 6.0
  public var opacity: Float = 0.3
}




//MARK: - AGShadowable
public protocol AGShadowable {
  
  var vm_shadow: AGShadowModel { get set }
  func setupShadow()
  
}



//MARK: - Implements
public extension AGShadowable where Self: UIView {
  
  public func setupShadow() {
    layer.shadowColor = vm_shadow.color.cgColor
    layer.shadowOffset = vm_shadow.offset
    layer.shadowRadius = vm_shadow.radius
    layer.shadowOpacity = vm_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: vm_shadow.radius).cgPath
  }
  
}



//MARK: - Implements - UITableViewCell
public extension AGShadowable where Self: UITableViewCell {
  
  public func setupShadow() {
    layer.shadowColor = vm_shadow.color.cgColor
    layer.shadowOffset = vm_shadow.offset
    layer.shadowRadius = vm_shadow.radius
    layer.shadowOpacity = vm_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: vm_shadow.radius).cgPath
  }
  
}



//MARK: - Implements - UICollectionViewCell
public extension AGShadowable where Self: UICollectionViewCell {
  
  public func setupShadow() {
    layer.shadowColor = vm_shadow.color.cgColor
    layer.shadowOffset = vm_shadow.offset
    layer.shadowRadius = vm_shadow.radius
    layer.shadowOpacity = vm_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: vm_shadow.radius).cgPath
  }
  
}



//MARK: - Implements - UITableViewHeaderFooterView
public extension AGShadowable where Self: UITableViewHeaderFooterView {
  
  public func setupShadow() {
    layer.shadowColor = vm_shadow.color.cgColor
    layer.shadowOffset = vm_shadow.offset
    layer.shadowRadius = vm_shadow.radius
    layer.shadowOpacity = vm_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: vm_shadow.radius).cgPath
  }
  
}



//MARK: - Implements - UICollectionReusableView
public extension AGShadowable where Self: UICollectionReusableView {
  
  public func setupShadow() {
    layer.shadowColor = vm_shadow.color.cgColor
    layer.shadowOffset = vm_shadow.offset
    layer.shadowRadius = vm_shadow.radius
    layer.shadowOpacity = vm_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: vm_shadow.radius).cgPath
  }
  
}



