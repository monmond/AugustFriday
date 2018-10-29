//
//  BaseCollectionCell.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension AGCollectionCell: AGReusable { }
extension AGCollectionCell: AGShadowable { }
extension AGCollectionCell: AGRadiusable { }
extension AGCollectionCell: AGBouncingView { }



//MARK: - AGCollectionCell
open class AGCollectionCell: UICollectionViewCell {
  
  open var vm_shadow = AGShadowModel()
  open var vm_radius = AGRadiusModel()
  
  
  
  //MARK: - Life Cycle
  open override func awakeFromNib() {
    super.awakeFromNib()
//    setupView()
  }
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    
  }
 
  
  
  //MARK: - Shadowable
  open func settingShadow() {
    vm_shadow.color = UIColor.darkGray
    vm_shadow.offset = CGSize(width:0, height: 1.0)
    vm_shadow.radius = 6.0
    vm_shadow.opacity = 0.3
  }
  
  
  
  //MARK: - Radiusable
  open func settingRadius() {
    vm_radius.color = UIColor.clear
    vm_radius.radius = 6.0
    vm_radius.width = 0.0
  }
 
}
