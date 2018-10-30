//
//  ChoicePopupCC.swift
//  TestSlim
//
//  Created by sasawat sankosik on 11/5/17.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - ChoicePopupCCM
struct ChoicePopupCCM: AGGenericCM {
  var tag: Int = 0
  var name: String = ""
  var icon: UIImage? = nil
  var isUserInteraction: Bool = false
}



//MARK: - Extensions
extension ChoicePopupCC: AGGenericCC { }
extension ChoicePopupCC: AGViewFontTextStyleDependency { }



//MARK: - ChoicePopupCC
class ChoicePopupCC: AGCollectionCell {
  
  //MARK: - Sizing
  class SC: AGSizeClassUICollection {
    
    static func size(with bound: CGRect = .zero) -> CGSize {
      let size = bound.width.rounded(.down)
      return CGSize(width: size ,height: 60)
    }
    
  }
  
  
  
  //MARK: - UI
  var v_container: UIView!
  var lb_title: UILabel!
  var v_seperator: UIView!
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
    v_seperator.isHidden = true
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
    v_container.backgroundColor = AG.C.Theme.cell_bg_1

    v_seperator = UIView()
    v_seperator.backgroundColor = AG.C.Theme.v_seperator

    lb_title = UILabel()
    lb_title.text = "-"
    lb_title.textColor = AG.C.Theme.cell_lb_1
    lb_title.font = UIFont.boldSystemFont(ofSize: lb_title.font.pointSize)
    lb_title.backgroundColor = AG.C.clear
    
    imgv_icon = UIImageView()
    imgv_icon.image = nil
    imgv_icon.contentMode = .scaleAspectFit
    imgv_icon.backgroundColor = AG.C.Theme.cell_bg_default
    imgv_icon.clipsToBounds = true

    let font_using = AG.F.System.font(with: .body)
    viewFontTextAdjustsFonts(with: v_infoLabelACSC, font: font_using)

    contentView.addSubview(v_container)
    v_container.addSubview(v_seperator)
    v_container.addSubview(lb_title)
    v_container.addSubview(imgv_icon)
    
    
  }
  
  func setupSnp() {

    v_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }

    v_seperator.snp.makeConstraints {
      $0.right.bottom.left.equalToSuperview()
      $0.height.equalTo(0.5)
    }

    imgv_icon.snp.makeConstraints {
      $0.right.equalTo(lb_title.snp.left).offset(-15)
      $0.centerY.equalToSuperview()
      $0.height.equalTo(20)
      $0.width.equalTo(imgv_icon.snp.height)
    }
    
    lb_title.snp.makeConstraints {
      $0.center.equalToSuperview()
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
    if let d = data as? ChoicePopupCCM {
      lb_title.text = d.name
      imgv_icon.image = d.icon?.overlay(with: AG.C.red)
    } else {
      
    }
  }

  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  


  
}

