//
//  UICollectionView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Setup
public extension UICollectionView {
  
  public func setupDefault() {
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
    alwaysBounceVertical = false
    alwaysBounceHorizontal = false
    backgroundColor = UIColor.clear
  }
  
  public func setBackgroundImage(image: UIImage) {
    backgroundColor = AG.Cons.Color.clear
    let img = UIImageView(image: image)
    img.contentMode = .scaleAspectFill
    backgroundView = img
  }
  
}




//MARK: - Register cell
public extension UICollectionView {
  
  public func registerCellClass(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    self.register(cellClass, forCellWithReuseIdentifier: identifier)
  }
  
  public func registerCellNib(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forCellWithReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewClass(_ viewClass: AnyClass, kind: String) {
    let identifier = String.className(viewClass)
    self.register(viewClass, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewNib(_ viewClass: AnyClass, kind: String) {
    let identifier = String.className(viewClass)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
}



//MARK: - Dequeue cell
public extension UICollectionView {
  
  public func dequeueReusableCell<T: AGReusable>(_ type: T.Type, for index: IndexPath) -> T {
    return self.dequeueReusableCell(withReuseIdentifier: type.reuseId, for: index) as! T
  }
  
  public func dequeueReusableCell<T: AGReusable>(_ ofKind: String, type: T.Type, for index: IndexPath) -> T {
    return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: type.reuseId, for: index) as! T
  }
  
}
