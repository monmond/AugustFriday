//
//  ChoicePopupCCA.swift
//  atimemedia
//
//  Created by sasawat sankosik on 20/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - ChoicePopupCCAM
struct ChoicePopupCCAM: AGGenericCCAM {
  var rows: [AGGenericCM] = []
}



//MARK: - Extensions
extension ChoicePopupCCA: AGChoicePopupAGGenericCCA { }
extension ChoicePopupCCA: UICollectionViewDataSource { }
extension ChoicePopupCCA: UICollectionViewDelegate { }
extension ChoicePopupCCA: UICollectionViewDelegateFlowLayout { }



//MARK: - ChoicePopupCCA
class ChoicePopupCCA: AGAdapter {
  
  //MARK: - Action
  
  
  
  //MARK: - UI
  private(set) weak var collection: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias cc_using = ChoicePopupCC
  
  
  
  //MARK: - Instance
  weak var delegate_generic: AGGenericCCADelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var h_ccUsing: CGFloat {
    return cc_using.SC.size().height
  }
  private(set) var displayed: ChoicePopupCCAM = ChoicePopupCCAM()
  
  
  
  //MARK: - Initial
  required init(collection: UICollectionView) {
    super.init()
    self.collection = collection
    onInit()
  }
  
  deinit {
    onDeinit()
  }



  //MARK: - Life cycle
  func onInit() {
    setupUI()
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupUI() {
    collection.setupDefault()
    collection.delegate = self
    collection.dataSource = self
    collection.allowsSelection = true
    collection.backgroundColor = AG.C.Theme.v_bg_2
    collection.registerCellClass(cc_using.self)
    collection.isUserInteractionEnabled = false
    
    collection.showsVerticalScrollIndicator = false
    collection.showsHorizontalScrollIndicator = false

  }
  
  func setupData(with data: AGGenericCCAM) {
    if let d = data as? ChoicePopupCCAM {
      displayed = d
      collection.isUserInteractionEnabled = true
      collection.reloadData()
    } else {
      
    }
  }
  
  
  //MARK: - Core - SkeletonCollectionViewDataSource
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return displayed.rows.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(cc_using.self, for: indexPath)
    let item = displayed.rows[indexPath.row]
    cell.setupTag(with: indexPath)
    cell.setupData(with: item)
    return cell
  }
  


  //MARK: - Core - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard displayed.rows.count > 0 else {
      return
    }
    if let _ = displayed.rows[indexPath.row] as? ChoicePopupCCM {
      
    }
    delegate_generic?.genericCCAItemPressed(with: self, indexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    let flag_lastRow = indexPath.row == displayed.rows.count - 1
    let cell = cell as? cc_using
    cell?.v_seperator.isHidden = flag_lastRow
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    super.agAdapterCollectionView(collectionView, didHighlightItemAt: indexPath)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    super.agAdapterCollectionView(collectionView, didUnhighlightItemAt: indexPath)
    
  }
  


  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return ChoicePopupCC.SC.size(with: collectionView.frame)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return ChoicePopupCC.SC.lineSpace()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return ChoicePopupCC.SC.itemSpace()
  }
  
}
