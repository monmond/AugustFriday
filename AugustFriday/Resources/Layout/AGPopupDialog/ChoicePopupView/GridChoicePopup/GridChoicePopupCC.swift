//
//  GridChoicePopupCC.swift
//  atimemedia
//
//  Created by sasawat sankosik on 25/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - GridChoicePopupCCM
struct GridChoicePopupCCM: AGGenericCM {
  var tag: Int = 0
  var name: String = ""
  var icon: UIImage? = nil
  var isUserInteraction: Bool = false
}



//MARK: - Extensions
extension GridChoicePopupCC: AGGenericCC { }
extension GridChoicePopupCC: AGViewFontTextStyleDependency { }



//MARK: - GridChoicePopupCC
class GridChoicePopupCC: AGCollectionCell {
  
  //MARK: - Sizing
  class SC: AGSizeClassUICollection {
    
    static func size(with bound: CGRect = .zero) -> CGSize {
      let size = (bound.width / 3).rounded(.down) - (itemSpace() * 2)
      return CGSize(width: size ,height: size)
    }
    
    static func itemSpace(with bound: CGRect = .zero) -> CGFloat {
      return 5
    }
    
    static func lineSpace(with bound: CGRect = .zero) -> CGFloat {
      return 5
    }
    
    static func inset(with bound: CGRect = .zero) -> UIEdgeInsets {
      return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
  }
  
  
  
  //MARK: - UI
  var v_container: UIView!
  var lb_title: UILabel!
  var imgv_icon: UIImageView!
  
  var v_infoLabelACSC: [UIView] {
    return [lb_title]
  }
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var sc_size: CGFloat {
    return SC.size().height
  }
  
  
  //MARK: - Initial
  convenience init() {
    self.init(frame: .zero)
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    onInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - Life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    onInit()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  func onInit() {
    setupUI()
    setupSnp()
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup Data
  func setupUI() {
    setupDefault()
    backgroundColor = AG.C.Theme.cell_bg_1
    contentView.backgroundColor = AG.C.Theme.cell_bg_1
    
    v_container = UIView()
//    v_container.backgroundColor = AG.Color.Theme.cell_bg_1
    v_container.backgroundColor = AG.C.red
    
    lb_title = UILabel()
    lb_title.text = "-"
    lb_title.textColor = AG.C.Theme.cell_lb_1
    lb_title.font = UIFont.boldSystemFont(ofSize: lb_title.font.pointSize)
    lb_title.backgroundColor = AG.C.clear
    lb_title.textAlignment = .center
    
    imgv_icon = UIImageView()
    imgv_icon.image = nil
    imgv_icon.contentMode = .scaleAspectFit
    imgv_icon.backgroundColor = AG.C.Theme.cell_bg_default
    imgv_icon.clipsToBounds = true
    
    let font_using = AG.F.System.font(with: .body)
    viewFontTextAdjustsFonts(with: v_infoLabelACSC, font: font_using)
    
    contentView.addSubview(v_container)
    v_container.addSubview(lb_title)
    v_container.addSubview(imgv_icon)
    
    
  }
  
  func setupSnp() {
    
    v_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    
    imgv_icon.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.7)
      $0.height.equalTo(imgv_icon.snp.width)
    }
    
    lb_title.snp.makeConstraints {
      $0.top.equalTo(imgv_icon.snp.bottom)
      $0.right.bottom.left.equalToSuperview()
    }
    
  }
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Interaction & Presentation
  
  
  
  //MARK: - Display
  
  
  
  func setupData() {
    
  }
  
  func setupData(with data: AGGenericCM) {
    if let d = data as? GridChoicePopupCCM {
      lb_title.text = d.name
      imgv_icon.image = d.icon?.overlay(with: AG.C.red)
    } else {
      
    }
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
  
}
