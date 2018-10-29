//
//  AGGenericCC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGGenericCM
public protocol AGGenericCM {
  
}



//MARK: - AGGenericCC
public protocol AGGenericCC {
  func setupTag(with index: IndexPath)
  func setupData(with data: AGGenericCM)
}



//MARK: - AGGenericCCAM
public protocol AGGenericCCAM {
  var rows: [AGGenericCM] { get set }
  init()
}



//MARK: - AGGenericCCA
public protocol AGGenericCCA: class {
  var delegate_generic: AGGenericCCADelegate? { get set }
  func setupData(with data: AGGenericCCAM)
  //  init(collection: UICollectionView)
}



//MARK: - AGGenericCCADelegate
public protocol AGGenericCCADelegate: class {
  func genericCCAItemPressed(with adpater: AGGenericCCA, indexPath: IndexPath)
}
