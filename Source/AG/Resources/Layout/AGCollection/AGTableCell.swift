//
//  BaseTableCell.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension AGTableCell: AGReusable { }
extension AGTableCell: AGShadowable { }
extension AGTableCell: AGRadiusable { }
extension AGTableCell: AGBouncingView { }



//MARK: - AGTableCell
open class AGTableCell: UITableViewCell {
  
  open var vm_shadow = AGShadowModel()
  open var vm_radius = AGRadiusModel()
  
  //MARK: - Life Cycle
  override open func awakeFromNib() {
    super.awakeFromNib()
    //    setupView()
  }
  
  override open func prepareForReuse() {
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



