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
  
  open var setting_shadow = AGShadowSetting()
  open var setting_radius = AGRadiusSetting()
  
  
  
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
    setting_shadow.color = BaseColor.gray_dark
    setting_shadow.offset = CGSize(width:0, height: 1.0)
    setting_shadow.radius = 6.0
    setting_shadow.opacity = 0.3
  }
  
  public final func setupShadow() {
    layer.shadowColor = setting_shadow.color.cgColor
    layer.shadowOffset = setting_shadow.offset
    layer.shadowRadius = setting_shadow.radius
    layer.shadowOpacity = setting_shadow.opacity
    layer.masksToBounds = false
    layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                    cornerRadius: contentView.layer.cornerRadius).cgPath
  }
  
  
  
  //MARK: - Radiusable
  open func settingRadius() {
    setting_radius.color = BaseColor.clear
    setting_radius.radius = 6.0
    setting_radius.width = 0.0
  }
 
  public final func setupRadius() {
    contentView.layer.borderColor = setting_radius.color.cgColor
    contentView.layer.cornerRadius = setting_radius.radius
    contentView.layer.borderWidth = setting_radius.width
    contentView.layer.masksToBounds = true
  }
  
}
