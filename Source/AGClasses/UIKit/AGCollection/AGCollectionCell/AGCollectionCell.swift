//
//  BaseCollectionCell.swift
//  AugestFriday
//
//  Created by Sasawat Sankosik on 7/3/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import UIKit



open class AGCollectionCell: UICollectionViewCell, AGReusable, AGShadowable, AGRadiusable, AGBouncingView {
  
  //MARK: - Sizing
//  open class func inset() -> UIEdgeInsets {
//    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//  }
//
//  open class func size(_ bound: CGRect) -> CGSize {
//    return CGSize(width: 0, height: 0)
//  }
//
//  open class func itemSpace() -> CGFloat {
//    return 0
//  }
//
//  open class func lineSpace() -> CGFloat {
//    return 0
//  }
//
//  open class func offset() -> CGPoint {
//    return CGPoint.zero
//  }

  
  
  //MARK: - UI
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Storage
  open var setting_shadow = AGShadowSetting()
  open var setting_radius = AGRadiusSetting()
  
  
  
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
  
  // MARK: Setup UI
  
//  open func setupView() {
//
//  }
  

  // MARK: Shadowable
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
  
  
  // MARK: Radiusable
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
