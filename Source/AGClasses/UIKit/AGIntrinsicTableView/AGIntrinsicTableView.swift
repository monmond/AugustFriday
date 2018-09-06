//
//  AGIntrinsicTableView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



open class IntrinsicTableView: UITableView {
  
  open override var contentSize: CGSize {
    didSet {
      self.invalidateIntrinsicContentSize()
    }
  }
  
  open override var intrinsicContentSize: CGSize {
    self.layoutIfNeeded()
    return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
  }
  
}
