//
//  AGGenericTC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGGenericTM
public protocol AGGenericTM {
  
}



//MARK: - AGGenericTC
public protocol AGGenericTC {
  
  func setupTag(with index: IndexPath)
  func setupData(with data: AGGenericTM)
  
}



//MARK: - AGGenericTCAM
public protocol AGGenericTCAM {
  
  var rows: [AGGenericTM] { get set }
  init()
  
}



//MARK: - AGGenericTCA
public protocol AGGenericTCA: class {
  
  var delegate_generic: AGGenericTCADelegate? { get set }
  func setupData(with data: AGGenericTCAM)
  //  init(collection: UICollectionView)
  
}



//MARK: - AGGenericTCADelegate
public protocol AGGenericTCADelegate: class {
  
  func genericCCAItemPressed(with adpater: AGGenericTCA, indexPath: IndexPath)
  
}
