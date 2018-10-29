//
//  RaduisSetting.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGRadiusModel
public struct AGRadiusModel {
  public var color: UIColor = UIColor.clear
  public var radius: CGFloat = 6.0
  public var width: CGFloat = 0.0
}



//MARK: - AGRadiusable
public protocol AGRadiusable {
  
  var vm_radius: AGRadiusModel { get set }
  func setupRadius()
  
}



//MARK: - Implements
public extension AGRadiusable where Self: UIView {
  
  public func setupRadius() {
    layer.borderColor = vm_radius.color.cgColor
    layer.cornerRadius = vm_radius.radius
    layer.borderWidth = vm_radius.width
    layer.masksToBounds = true
  }
  
}



//MARK: - Implements - UITableViewCell
public extension AGRadiusable where Self: UITableViewCell {
  
  public func setupRadius() {
    contentView.layer.borderColor = vm_radius.color.cgColor
    contentView.layer.cornerRadius = vm_radius.radius
    contentView.layer.borderWidth = vm_radius.width
    contentView.layer.masksToBounds = true
  }
  
}



//MARK: - Implements - UICollectionViewCell
public extension AGRadiusable where Self: UICollectionViewCell {
  
  public func setupRadius() {
    contentView.layer.borderColor = vm_radius.color.cgColor
    contentView.layer.cornerRadius = vm_radius.radius
    contentView.layer.borderWidth = vm_radius.width
    contentView.layer.masksToBounds = true
  }
  
}



//MARK: - Implements - UITableViewHeaderFooterView
public extension AGRadiusable where Self: UITableViewHeaderFooterView {
  
  public func setupRadius() {
    contentView.layer.borderColor = vm_radius.color.cgColor
    contentView.layer.cornerRadius = vm_radius.radius
    contentView.layer.borderWidth = vm_radius.width
    contentView.layer.masksToBounds = true
  }
  
}



//MARK: - Implements - UICollectionReusableView
public extension AGRadiusable where Self: UICollectionReusableView {
  
  public func setupRadius() {
    layer.borderColor = vm_radius.color.cgColor
    layer.cornerRadius = vm_radius.radius
    layer.borderWidth = vm_radius.width
    layer.masksToBounds = true
  }
  
}







