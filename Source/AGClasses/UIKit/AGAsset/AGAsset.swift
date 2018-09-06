//
//  AGAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit


//MARK: - AGAsset
public protocol AGAsset {
  
  var bundle: Bundle? { get }
  var name: String { get }
  init(raw: String)
  var image: UIImage { get }
  func image(_ overlayColor: AGColor) -> UIImage
  
}



//MARK: - Implements
public extension AGAsset {
  
  fileprivate var assetName: String {
    let assetName = name
    return assetName.lowercased()
    
  }
  
  fileprivate func create() -> UIImage? {
    let image: UIImage?
    if let b = bundle {
      image = UIImage(named: assetName, in: b, compatibleWith: nil)
    } else {
      image = UIImage(named: assetName)
    }
    return image
    
  }
  
  public var image: UIImage {
    return create() ?? UIImage()
    
  }
  
  public func image(_ overlayColor: AGColor) -> UIImage {
    let image = create()
    if let newColor = image?.overlay(color: overlayColor.color) {
      return newColor
    }
    return image ?? UIImage()
    
  }
  
}

