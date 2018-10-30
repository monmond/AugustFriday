//
//  ChoicePopupController.swift
//  TestSlim
//
//  Created by sasawat sankosik on 11/5/17.
//  Copyright © 2017 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import SnapKit
import PopupDialog
import Kingfisher



//MARK: - ChoicePopupVM
struct ChoicePopupVM {
  
  struct HeaderImage {
    var url: String? = nil
    var icon: UIImage? = nil
  }
  
  struct Info {
    var title: String = "Title"
    var message: String? = nil
  }
  
  struct ViewModel {
    var adpater_using: AGChoicePopupAGGenericCCA.Type!
    var headerImage = HeaderImage()
    var info = Info()
    var choice: AGGenericCCAM!
  }
  
}



//MARK: - Extensions
extension ChoicePopupVC: AGGenericCCADelegate { }
extension ChoicePopupVC: AGViewFontTextStyleDependency { }


//MARK: - ChoicePopupVC
class ChoicePopupVC: AGPopupVC {
  
  //MARK: - UI
  var stv_container: UIStackView!
  var v_header: UIView!
  var stv_header: UIStackView!
  var imgv_header: UIImageView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_message: UILabel!
  var v_seperator: UIView!
  var collection_detail: UICollectionView!
  
  var v_infoLabelACSC: [UIView] {
    return [lb_title, lb_message]
  }
  
  
  //MARK: - NSLayout
  var con_imageHeaderHeight: Constraint!
  var con_collectionDetailHeight: Constraint!
  var con_collectionHeight: CGFloat {
    return adapter_choicePopup.h_ccUsing
  }
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  var adapter_choicePopup: AGChoicePopupAGGenericCCA!
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var h_scale: CGFloat = 0.6
  var displayed = ChoicePopupVM.ViewModel()
  var indexPath = IndexPath(row: 0, section: 0)
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    
  }
  
  
  
  //MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: - Setup View
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    view.backgroundColor = AG.C.Theme.cell_bg_1
    
    stv_container = UIStackView()
    stv_container.backgroundColor = AG.C.clear
    stv_container.axis = .vertical
    stv_container.alignment = .fill
    stv_container.distribution = .fill
    stv_container.spacing = 0

    v_header = UIView()
    v_header.backgroundColor = AG.C.Theme.cell_bg_1
    
    stv_header = UIStackView()
    stv_header.backgroundColor = AG.C.clear
    stv_header.axis = .horizontal
    stv_header.alignment = .top
    stv_header.distribution = .fill
    stv_header.spacing = 20
    
    imgv_header = UIImageView()
    imgv_header.image = nil
    imgv_header.contentMode = .scaleAspectFit
    imgv_header.backgroundColor = AG.C.Theme.cell_bg_default
    imgv_header.clipsToBounds = true
    
    stv_info = UIStackView()
    stv_info.backgroundColor = AG.C.clear
    stv_info.axis = .vertical
    stv_info.alignment = .fill
    stv_info.distribution = .fill
    stv_info.spacing = 0

    lb_title = UILabel()
    lb_title.text = "-"
    lb_title.textColor = AG.C.Theme.cell_lb_2
//    lb_title.textColor = AG.Color.red
//    lb_title.font = AppFont.DBOzoneX.bold.with(size: 22)
    lb_title.font = UIFont.boldSystemFont(ofSize: lb_title.font.pointSize)
    lb_title.backgroundColor = AG.C.clear
    
    lb_message = UILabel()
    lb_message.text = "-"
    lb_message.textColor = AG.C.Theme.cell_lb_1
    lb_message.font = UIFont.boldSystemFont(ofSize: lb_title.font.pointSize)
    lb_message.backgroundColor = AG.C.clear
    lb_message.numberOfLines = 0
    
    v_seperator = UIView()
    v_seperator.backgroundColor = AG.C.Theme.v_seperator

    let layout = UICollectionViewFlowLayout()
    collection_detail = UICollectionView(frame: .zero, collectionViewLayout: layout)
    adapter_choicePopup = displayed.adpater_using.init(collection: collection_detail)
    adapter_choicePopup?.delegate_generic = self
    
    let font_using = AG.F.System.font(with: .body)
    viewFontTextAdjustsFonts(with: v_infoLabelACSC, font: font_using)

    view.addSubview(stv_container)
    v_header.addSubview(stv_header)
    v_header.addSubview(v_seperator)
    stv_container.addArrangedSubview(v_header)
    stv_container.addArrangedSubview(collection_detail)
    stv_header.addArrangedSubview(imgv_header)
    stv_header.addArrangedSubview(stv_info)
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_message)
  }
  
  func setupSnp() {
    
    lb_title.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    lb_message.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    
    stv_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    
    stv_header.snp.makeConstraints {
      $0.edges.equalTo(UIEdgeInsets(top: 25, left: 20, bottom: 25, right: 20))
    }
    
    imgv_header.snp.makeConstraints {
      con_imageHeaderHeight = $0.height.equalTo(71).constraint
      $0.width.equalTo(imgv_header.snp.height)
    }
    
    lb_title.snp.makeConstraints {
      $0.height.equalTo(25)
    }
    
    v_seperator.snp.makeConstraints {
      $0.right.bottom.left.equalToSuperview()
      $0.height.equalTo(0.5)
    }
    
    collection_detail.snp.makeConstraints {
      con_collectionDetailHeight = $0.height.equalTo(88).constraint
    }
    
  }
  
  
  
  //MARK: - Setup Data
  func setupDataOnViewDidLoad() {
    fetchData()
  }

  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - Interaction & Presentation
  func fetchData() {
    DispatchQueue.main.async {
      self.displayFetchData()
    }
  }
  
  
  
  //MARK: - Display
  func displayFetchData() {
    let headerImage = displayed.headerImage
    if let url = headerImage.url {
      let url = URL(string: url)
      imgv_header.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))])
    } else if let icon = headerImage.icon, icon != .none {
      imgv_header.image = icon.overlay(with: AG.C.red)
      imgv_header.backgroundColor = AG.C.clear
      con_imageHeaderHeight.update(offset: 35)
    } else {
      imgv_header.isHidden = true
    }
    
    let info = displayed.info
    lb_title.text = info.title.uppercased()
    lb_message.attributedText = getMessageLeadingTextAttributed(with: info.message ?? "")
    
    
      let count = self.displayed.choice.rows.count
      if count > 0 {
        let con_collectionHeightMaximun = (UIScreen.main.bounds.height * self.h_scale)
        let h_sum: CGFloat = self.con_collectionHeight * CGFloat(count)
        if h_sum < con_collectionHeightMaximun {
          self.con_collectionDetailHeight.update(offset: con_collectionHeightMaximun)
        } else {
          self.con_collectionDetailHeight.update(offset: con_collectionHeightMaximun)
        }
      } else {
        self.con_collectionDetailHeight.update(offset: self.con_collectionHeight)
      }
      self.adapter_choicePopup.setupData(with: self.displayed.choice)
    
    
  }
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - AGGenericCCADelegate
  func genericCCAItemPressed(with adpater: AGGenericCCA, indexPath: IndexPath) {
    self.indexPath = indexPath
    cancelButtonPressed(nil)
  }
  
  
  
  //MARK: - Pods - Protocol
  
  
}

