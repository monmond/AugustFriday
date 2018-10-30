//
//  GridChoicePopupCCA.swift
//  atimemedia
//
//  Created by sasawat sankosik on 25/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - GridChoicePopupCCAM
struct GridChoicePopupCCAM: AGGenericCCAM {
  var rows: [AGGenericCM] = []
}



//MARK: - Extensions
extension GridChoicePopupCCA: AGChoicePopupAGGenericCCA { }
extension GridChoicePopupCCA: UICollectionViewDataSource { }
extension GridChoicePopupCCA: UICollectionViewDelegate { }
extension GridChoicePopupCCA: UICollectionViewDelegateFlowLayout { }



//MARK: - GridChoicePopupCCA
class GridChoicePopupCCA: AGAdapter {
  
  //MARK: - Action
  
  
  
  //MARK: - UI
  private(set) weak var collection: UICollectionView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  typealias cc_using = GridChoicePopupCC
  
  
  
  //MARK: - Instance
  weak var delegate_generic: AGGenericCCADelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var h_ccUsing: CGFloat {
    return cc_using.SC.size(with: collection.frame).height
  }
  private(set) var displayed: GridChoicePopupCCAM = GridChoicePopupCCAM()
  
  
  
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
    
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = GridChoicePopupCC.SC.lineSpace()
    layout.minimumInteritemSpacing = GridChoicePopupCC.SC.itemSpace()
    layout.sectionInset = GridChoicePopupCC.SC.inset()
    collection.collectionViewLayout = layout
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
    if let d = data as? GridChoicePopupCCAM {
      displayed = d
      collection.isUserInteractionEnabled = true
      collection.reloadData()
      if let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
        layout.minimumLineSpacing = GridChoicePopupCC.SC.lineSpace()
        layout.minimumInteritemSpacing = GridChoicePopupCC.SC.itemSpace()
        layout.sectionInset = GridChoicePopupCC.SC.inset()
        layout.invalidateLayout()
      }
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
    if let _ = displayed.rows[indexPath.row] as? GridChoicePopupCCM {
      
    }
    delegate_generic?.genericCCAItemPressed(with: self, indexPath: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    super.agAdapterCollectionView(collectionView, didHighlightItemAt: indexPath)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    super.agAdapterCollectionView(collectionView, didUnhighlightItemAt: indexPath)
    
  }
  
  
  
  //MARK: - Core - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return GridChoicePopupCC.SC.size(with: collectionView.frame)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return GridChoicePopupCC.SC.lineSpace()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return GridChoicePopupCC.SC.itemSpace()
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return GridChoicePopupCC.SC.inset()
  }
  
}
