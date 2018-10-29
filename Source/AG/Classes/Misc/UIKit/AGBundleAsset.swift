//
//  BaseAsset.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGBundleAsset
public class AGBundleAsset: _ExpressibleByImageLiteral {
  
  public let image: UIImage?
  public required init(imageLiteralResourceName name: String) {
    let bundle = Bundle(for: AGBundleAsset.self)
    image = UIImage(named: name, in: bundle, compatibleWith: nil)
  }
  
}



//MARK: - UIImage+AGBundleAsset
public extension UIImage {
  
  public static func fromWrappedBundleImage(_ wrappedImage: AGBundleAsset) -> UIImage? {
    return wrappedImage.image
  }
  
}
