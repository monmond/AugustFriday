//
//  AGAdapter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGAdapter
open class AGAdapter: NSObject {
  
  public func agAdapterCollectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? AGCollectionCell
    cell?.goSquash()
  }
  
  public func agAdapterCollectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as? AGCollectionCell
    cell?.goBouncing()
  }
  
}
