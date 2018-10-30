//
//  ConfirmTextPopupVC.swift
//  SCSmartHome
//
//  Created by sasawat sankosik on 9/26/17.
//  Copyright © 2017 AIS. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog
import IQKeyboardManagerSwift



//MARK: - ConfirmTextPopupVM
struct ConfirmTextPopupVM {
  
  struct Info {
    var title: String = "Title"
    var message: String? = nil
  }
  
  struct TextField {
    var placeholder: String? = nil
  }
  
  struct Button {
    var title_cancel: String? = "Cancel"
    var title_ok: String? = "Ok"
  }
  
  struct ViewModel {
    var info = Info()
    var textField = TextField()
    var button = Button()
  }
  
}



//MARK: - Extensions
extension ConfirmTextPopupVC: AGViewFontTextStyleDependency { }
extension ConfirmTextPopupVC: UITextFieldDelegate { }
extension ConfirmTextPopupVC: AGVCTextFieldDependency { }



//MARK: - ConfirmTextPopupVC
class ConfirmTextPopupVC: AGPopupVC {
  
  //MARK: - UI
  var v_container: UIView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_message: UILabel!
  var txt_frist: UITextField!
  var stv_button: UIStackView!
  var btn_cancel: AGButton!
  var btn_ok: AGButton!
  
  var v_infoLabelACSC: [UIView] {
  return [lb_title, lb_message, txt_frist]
  }
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  var displayed = ConfirmTextPopupVM.ViewModel()
  
  
  
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
    lb_title.textAlignment = .left
    
    lb_message = UILabel()
    lb_message.text = "-"
    lb_message.textColor = AG.C.Theme.cell_lb_1
    lb_message.font = UIFont.systemFont(ofSize: lb_title.font.pointSize)
    lb_message.backgroundColor = AG.C.clear
    lb_message.numberOfLines = 0
    lb_message.textAlignment = .left
    
    txt_frist = UITextField()
    txt_frist.delegate = self
    txt_frist.backgroundColor = AG.C.white
//    txt_frist.textColor = AG.Color.white
    txt_frist.textColor = AG.C.black
//    txt_frist.tintColor = AG.Color.white
    txt_frist.tintColor = AG.C.red
    txt_frist.keyboardToolbar.doneBarButton.setTarget(self, action: #selector(keyboardToolbarDoneBarButtonPressed))
    txt_frist.returnKeyType = .done
    txt_frist.clearButtonMode = .always
    txt_frist.borderStyle = .roundedRect
    txt_frist.textAlignment = .center

    txt_frist.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    txt_frist.clearsOnBeginEditing = false
    txt_frist.keyboardType = UIKeyboardType.default
//    txt_frist.isSecureTextEntry = true
//    txt_frist.enablesReturnKeyAutomatically = true
    
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
    btn_ok.isEnabled = false
    
    let font_using = AG.F.System.font(with: .body)
    viewFontTextAdjustsFonts(with: v_infoLabelACSC, font: font_using)
    
    view.addSubview(v_container)
    v_container.addSubview(stv_info)
    v_container.addSubview(txt_frist)
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
    
    stv_info.snp.makeConstraints {
      $0.top.equalToSuperview().inset(25)
      $0.right.equalToSuperview().inset(20)
      $0.left.equalToSuperview().inset(20)
    }
    
    txt_frist.snp.makeConstraints {
      $0.top.equalTo(stv_info.snp.bottom).offset(25)
      $0.right.equalToSuperview().inset(20)
      $0.left.equalToSuperview().inset(20)
      $0.height.equalTo(42)
    }
    
    lb_title.snp.makeConstraints {
      $0.height.equalTo(25)
    }
    
    lb_message.snp.makeConstraints {
      $0.height.lessThanOrEqualToSuperview().multipliedBy(0.5)
    }
    
    stv_button.snp.makeConstraints {
      $0.top.equalTo(txt_frist.snp.bottom).offset(20)
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
    let info = displayed.info
    lb_title.text = info.title.uppercased()
    lb_message.attributedText = getMessageCenterTextAttributed(with: info.message ?? "")
    
    let txt = displayed.textField
    txt_frist.placeholder = txt.placeholder
    
    let btn = displayed.button
    btn_cancel.setTitle(btn.title_cancel, for: .normal)
    btn_ok.setTitle(btn.title_ok, for: .normal)

  }
  
  
  //MARK: - Core - UITextFieldDelegate
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let result = agTextField(textField.text, replace: string, with: range) else { return true }
    switch textField {
    case txt_frist:
      return result.update.count <= 255
    default:
      return true
    }
  }
  
  @objc
  func textFieldEditingChanged(_ textField: UITextField) {
    var flag_enable = false
    if let txt = txt_frist.text, !txt.isEmpty {
      flag_enable = true
    }
    btn_ok.isEnabled = flag_enable
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
}

