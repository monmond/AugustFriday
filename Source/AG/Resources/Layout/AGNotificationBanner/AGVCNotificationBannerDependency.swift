//
//  AGVCNotificationBannerDependency.swift
//  atimemedia
//
//  Created by sasawat sankosik on 19/9/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit
import NotificationBannerSwift



//MARK: - AGBannerColor
public class AGBannerColor: BannerColorsProtocol {
  
  public func color(for style: BannerStyle) -> UIColor {
    switch style {
    case .danger:   return UIColor(red:0.90, green:0.31, blue:0.26, alpha:1.00)
    case .info:     return UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00)
    case .none:     return UIColor.clear
    case .success:  return UIColor(red:0.22, green:0.80, blue:0.46, alpha:1.00)
    case .warning:  return UIColor(red:1.00, green:0.66, blue:0.16, alpha:1.00)
    }
  }
  
}



//MARK: - AGVCBannerView
public class AGVCBannerView {
  
  public class func view(for style: BannerStyle) -> UIImageView {
    var image: UIImage?
    let color = AGBannerColor()
    switch style {
    case .danger:   image =  UIImage.color(with: color.color(for: .warning))
    case .info:     image =  UIImage.color(with: color.color(for: .success))
    case .none:     image =  UIImage.color(with: color.color(for: .warning))
    case .success:  image =  UIImage.color(with: color.color(for: .info))
    case .warning:  image =  UIImage.color(with: color.color(for: .danger))
    }
    return UIImageView(image: image)
  }
  
}



//MARK: - AGNotificationBannerVM
public struct AGNotificationBannerVM {
  var title: String
  var subtitle: String
  var style: BannerStyle
  var position: BannerPosition
}



//MARK: - AGVCNotificationBannerDependency
public protocol AGVCNotificationBannerDependency {
  
  func displayNotificationBanner(_ viewModel: AGNotificationBannerVM,
                                 on: UIViewController?,
                                 onTap: CBVoid?,
                                 onSwipeUp: CBVoid?)
  func displayStatusBarNotificationBanner(_ viewModel: AGNotificationBannerVM,
                                          on: UIViewController?,
                                          onTap: CBVoid?,
                                          onSwipeUp: CBVoid?)
  
}



//MARK: - Implements
public extension AGVCNotificationBannerDependency {
  
  public func displayNotificationBanner(_ viewModel: AGNotificationBannerVM,
                                 on: UIViewController?,
                                 onTap: CBVoid? = nil,
                                 onSwipeUp: CBVoid? = nil) {
    let banner = NotificationBanner(title: viewModel.title,
                                    subtitle: viewModel.subtitle,
                                    leftView: AGVCBannerView.view(for: viewModel.style),
                                    rightView: nil,
                                    style: viewModel.style,
                                    colors: AGBannerColor())
    banner.onTap = {
      if let t = onTap { t() } else { banner.dismiss() }
    }
    banner.onSwipeUp = {
      if let sw = onSwipeUp { sw() } else { banner.dismiss() }
    }
    banner.show(queuePosition: .back, bannerPosition: viewModel.position, on: on)
  }
  
  public func displayStatusBarNotificationBanner(_ viewModel: AGNotificationBannerVM,
                                          on: UIViewController?,
                                          onTap: CBVoid? = nil,
                                          onSwipeUp: CBVoid? = nil) {
    let banner = StatusBarNotificationBanner(title: "\(viewModel.title) \(viewModel.subtitle)",
                                             style: viewModel.style,
                                             colors: AGBannerColor())
    banner.onTap = {
      if let t = onTap { t() } else { banner.dismiss() }
    }
    banner.onSwipeUp = {
      if let sw = onSwipeUp { sw() } else { banner.dismiss() }
    }
    banner.show(queuePosition: .back, bannerPosition: viewModel.position, on: on)
  }
  
}



//MARK: Common function
public extension AGVCNotificationBannerDependency {
  
  public func kkk() {
    let banner = NotificationBanner(customView: NorthCarolinaBannerView())
    banner.show(queuePosition: .front, bannerPosition: .top)
  }
  
  
}
