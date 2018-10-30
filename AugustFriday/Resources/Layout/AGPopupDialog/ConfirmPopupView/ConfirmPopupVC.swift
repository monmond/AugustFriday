//
//  ConfirmPopupController.swift
//  TestSlim
//
//  Created by sasawat sankosik on 11/4/17.
//  Copyright © 2017 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import SnapKit
import PopupDialog



//MARK: - ConfirmPopupVM
struct ConfirmPopupVM {
  
  struct HeaderImage {
    var url: String? = nil
    var icon: UIImage? = nil
  }
  
  struct Info {
    var title: String = "Title"
    var message: String? = nil
  }
  
  struct Button {
    var title_cancel: String? = "Cancel"
    var title_ok: String? = "Ok"
    var flag_hideCancel: Bool = false
  }
  
  struct ViewModel {
    var headerImage = HeaderImage()
    var info = Info()
    var button = Button()
  }
  
}



//MARK: - Extensions
extension ConfirmPopupVC: AGViewFontTextStyleDependency { }



//MARK: - ConfirmPopupVC
class ConfirmPopupVC: AGPopupVC {
  
  //MARK: - UI
  var v_container: UIView!
  var v_header: UIView!
  var imgv_header: UIImageView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_message: UILabel!
  var stv_button: UIStackView!
  var btn_cancel: AGButton!
  var btn_ok: AGButton!
  
  var v_infoLabelACSC: [UIView] {
    return [lb_title, lb_message]
  }
  
  
  
  //MARK: - NSLayout
  var con_headerViewHeight: Constraint!
  var con_buttonLeading: Constraint!
  var con_buttonTrailing: Constraint!
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var displayed = ConfirmPopupVM.ViewModel()
  
  
  
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
    
    v_container = UIView()
    v_container.backgroundColor = AG.C.clear
    
    v_header = UIView()
    v_header.backgroundColor = AG.C.clear
    
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
    stv_info.spacing = 10
    
    lb_title = UILabel()
    lb_title.text = "-"
    lb_title.textColor = AG.C.Theme.cell_lb_2
//    lb_title.textColor = AG.Color.red
//    lb_title.font = AppFont.DBOzoneX.bold.with(size: 22)
    lb_title.font = UIFont.systemFont(ofSize: lb_title.font.pointSize)
    lb_title.backgroundColor = AG.C.clear
    lb_title.textAlignment = .center

    lb_message = UILabel()
    lb_message.text = "-"
    lb_message.textColor = AG.C.Theme.cell_lb_1
    lb_message.font = UIFont.systemFont(ofSize: lb_title.font.pointSize)
    lb_message.backgroundColor = AG.C.clear
    lb_message.numberOfLines = 0
    lb_message.textAlignment = .center
    
    stv_button = UIStackView()
    stv_button.backgroundColor = AG.C.clear
    stv_button.axis = .horizontal
    stv_button.alignment = .fill
    stv_button.distribution = .fillEqually
    stv_button.spacing = 0
    
    btn_cancel = AGButton()
    btn_cancel.setup(AG.B.Popup.Cancel())
    btn_cancel.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    
    btn_ok = AGButton()
    btn_ok.setup(AG.B.Popup.Confirm())
    btn_ok.addTarget(self, action: #selector(okButtonPressed), for: .touchUpInside)
    
    let font_using = AG.F.System.font(with: .body)
    viewFontTextAdjustsFonts(with: v_infoLabelACSC, font: font_using)

    view.addSubview(v_container)
    v_container.addSubview(v_header)
    v_header.addSubview(imgv_header)
    v_container.addSubview(stv_info)
    v_container.addSubview(stv_button)
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_message)
    stv_button.addArrangedSubview(btn_cancel)
    stv_button.addArrangedSubview(btn_ok)

  }
  
  func setupSnp() {
    
    lb_title.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)
    lb_message.setContentHuggingPriority(.fittingSizeLevel, for: .vertical)

    v_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }

    v_header.snp.makeConstraints {
      $0.top.right.left.equalToSuperview()
      con_headerViewHeight = $0.height.equalTo(85).constraint
    }

    imgv_header.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.7)
      $0.width.equalTo(imgv_header.snp.height)
    }
    
    stv_info.snp.makeConstraints {
      $0.top.equalTo(v_header.snp.bottom).offset(25)
      $0.right.equalToSuperview().inset(20)
      $0.left.equalToSuperview().inset(20)
    }

    lb_title.snp.makeConstraints {
      $0.height.equalTo(25)
    }

    lb_message.snp.makeConstraints {
      $0.height.lessThanOrEqualToSuperview().multipliedBy(0.5)
    }

    stv_button.snp.makeConstraints {
      $0.top.equalTo(stv_info.snp.bottom).offset(25)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(45)
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
    displayFetchData()
  }
  
  
  
  //MARK: - Display
  func displayFetchData() {
    let hi = displayed.headerImage
    if let url = hi.url {
      let url = URL(string: url)
      imgv_header.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))])
    } else if let icon = hi.icon, icon != .none {
      imgv_header.image = icon.overlay(with: AG.C.red)
      imgv_header.backgroundColor = AG.C.clear
    } else {
      con_headerViewHeight.update(offset: 0)
    }
    
    let info = displayed.info
    lb_title.text = info.title
    lb_message.attributedText = getMessageCenterTextAttributed(with: info.message ?? "")
  
    let b = displayed.button
    btn_cancel.setTitle(b.title_cancel, for: .normal)
    btn_ok.setTitle(b.title_ok, for: .normal)
    btn_cancel.isHidden = b.flag_hideCancel
    
  }
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
}

