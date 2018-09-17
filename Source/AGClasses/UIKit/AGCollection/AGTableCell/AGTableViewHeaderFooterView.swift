//
//  BaseTableViewHeaderFooterView.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 8/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import UIKit



open class AGTableViewHeaderFooterView: UITableViewHeaderFooterView, AGReusable {
  
  //MARK: -  Sizing
//  open class func inset() -> UIEdgeInsets {
//    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//  }
//
//  open class func height() -> CGFloat {
//    return 0
//  }


  //MARK: -  UI
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  
  
  
  // MARK: Life Cycle
  
  open override func awakeFromNib() {
    super.awakeFromNib()
//    setupView()
  }
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
}



// MARK: - Setup UI
public extension AGTableViewHeaderFooterView {
  
  //  open func setupView() {
  //
  //  }
  
  open func setupClear() {
    //    backgroundColor = BaseColor.clear.color
    
    backgroundView?.backgroundColor = BaseColor.clear.color
  }
  
}


