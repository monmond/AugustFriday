//
//  AGAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public protocol AGAsset {
  
  var prefix: String { get }
  var name: String { get }
  init(raw: String)
  var image: UIImage { get }
  func image(_ overlayColor: AGColor) -> UIImage
  
}

public extension AGAsset {
  
  fileprivate var assetName: String {
    let assetName = "\(prefix)\(name)"
    return assetName.lowercased()
  }
  
  public var image: UIImage {
    return UIImage(named: assetName) ?? UIImage()
  }
  
  public func image(_ overlayColor: AGColor) -> UIImage {
    let image = UIImage(named: assetName)
    if let newColor = image?.overlay(color: overlayColor.color) {
      return newColor
    }
    return image ?? UIImage()
  }
  
}

