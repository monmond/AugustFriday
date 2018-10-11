//
//  ReusebleCell.swift
//  AugestFriday
//
//  Created by sasawat sankosik on 10/1/17.
//  Copyright © 2017 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGReusable
public protocol AGReusable {
  
  static var name: String { get }
  static var reuseId: String { get }
  func setupTag(with index: IndexPath)
  func setupDefault()
  
}



//MARK: - Implements
public extension AGReusable {
  
  public static var name: String {
    return String(describing: self)
  }
  
  public static var reuseId: String {
    return String(describing: self)
  }
  
}



//MARK: - Implements - UIView
public extension AGReusable where Self: UIView {
  
  public func setupTag(with index: IndexPath) {
    tag = index.row
  }
  
  public func setupDefault() {
    backgroundColor = BaseColor.clear.color
  }
  
}



//MARK: - Implements - UITableViewCell
public extension AGReusable where Self: UITableViewCell {
  
  public func setupDefault() {
    selectionStyle = .none
    backgroundColor = BaseColor.clear.color
    contentView.backgroundColor = BaseColor.clear.color
  }
  
}



//MARK: - Implements - UICollectionViewCell
public extension AGReusable where Self: UICollectionViewCell {
  
  public func setupDefault() {
    backgroundColor = BaseColor.clear.color
    contentView.backgroundColor = BaseColor.clear.color
  }
  
}



//MARK: - Implements - UITableViewHeaderFooterView
public extension AGReusable where Self: UITableViewHeaderFooterView {
  
  public func setupDefault() {
    backgroundColor = BaseColor.clear.color
    contentView.backgroundColor = BaseColor.clear.color
  }
  
}



//MARK: - Implements - UICollectionReusableView
public extension AGReusable where Self: UICollectionReusableView {
  
  public func setupDefault() {
    backgroundColor = BaseColor.clear.color
  }
  
}







