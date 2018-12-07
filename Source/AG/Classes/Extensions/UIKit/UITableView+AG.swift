//
//  UITableView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 27/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Setup
public extension UITableView {
  
  public func setBottomInset(bottom: CGFloat = 40) {
    contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: 0)
  }
  
  public func setEmptyFooter(height: CGFloat = 0) {
    let rect = CGRect(x: 0, y: 0, width: frame.size.width, height: height)
    let v_footer = UIView(frame: rect)
    v_footer.backgroundColor = UIColor.clear
    tableFooterView = v_footer
  }
  
  public func setupDefault() {
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
    alwaysBounceVertical = true
    alwaysBounceHorizontal = false
    separatorStyle = .none
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
public extension UITableView {
  
  public func registerCellClass(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    self.register(cellClass, forCellReuseIdentifier: identifier)
  }
  
  public func registerCellNib(_ cellClass: AnyClass) {
    let identifier = String.className(cellClass)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forCellReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
    let identifier = String.className(viewClass)
    self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
  }
  
  public func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
    let identifier = String.className(viewClass)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
  }
  
}



//MARK: - Dequeue cell
public extension UITableView {
  
  public func dequeueReusableCell<T: AGReusable>(_ type: T.Type, for index: IndexPath) -> T {
    return self.dequeueReusableCell(withIdentifier: type.reuseId, for: index) as! T
  }
  
  public func dequeueReusableHeaderFooterView<T: AGReusable>(_ type: T.Type) -> T  {
    return self.dequeueReusableHeaderFooterView(withIdentifier: type.reuseId) as! T
  }
  
}



//MARK: - Reload
public extension UITableView {
  
  public func reloadSectionsWithoutAnimation(_ sections: IndexSet, with animation: UITableView.RowAnimation) {
    UIView.performWithoutAnimation {
      reloadSections(sections, with: animation)
    }
  }
  
  
}
