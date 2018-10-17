//
//  AGStateView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import NVActivityIndicatorView
import SnapKit



//MARK: - AGStateViewModel
public enum AGStateViewModel {
  
  open class Setting {
    
    public var image: UIImage?
    public var title: String?
    public var description: String?
    public var isIndicatorHidden: Bool = false
    
    public var tint: UIColor?
    public var bg_image: UIImage?
    
    public var font: UIFont?
    
    public init() {
      
    }
    
    public init(image: UIImage?,
                title: String?,
                description: String?,
                isIndicatorHidden: Bool = false,
                tint: UIColor?,
                bg_image: UIImage?,
                font: UIFont?) {
      self.image = image
      self.title = title
      self.description = description
      self.isIndicatorHidden = isIndicatorHidden
      self.tint = tint
      self.bg_image = bg_image
      self.font = font
    }
    
  }
  
  open class ViewModel {
    
    /// Normal
    public var normal: AGStateViewModel.Setting = AGStateViewModel.Setting()
    
    /// Loading
    public var loading: AGStateViewModel.Setting = AGStateViewModel.Setting()
    
    /// Tap to refresh or pull to refresh
    public var noResults: AGStateViewModel.Setting = AGStateViewModel.Setting()
    
    /// Tap to refresh or reconnect network
    public var noConnection: AGStateViewModel.Setting = AGStateViewModel.Setting()
    
    /// Tap to refresh
    public var error: AGStateViewModel.Setting = AGStateViewModel.Setting()
    
    public init() {
      
    }
    
    public func getSetting(with state: AGStateViewState) -> AGStateViewModel.Setting {
      var setting: AGStateViewModel.Setting
      switch state {
      case .normal:
        setting = normal
      case .loading:
        setting = loading
      case .noResults:
        setting = noResults
      case .noConnection:
        setting = noConnection
      case .error:
        setting = error
      }
      return setting
    }
    
  }
  
}


public enum AGStateViewState: CaseIterable {
  
  case normal
  case loading
  case noResults
  case noConnection
  case error
  
}



//MARK: - AGStateViewDelegate
public protocol AGStateViewDelegate: class {
  func stateViewPressed(with stateView: AGStateView , state: AGStateViewState)
}



//MARK: - AGStateView
public class AGStateView: UIView, AGReusable {
  
  //MARK: - UI
  var imgv_background: UIImageView!
  var v_top: UIView!
  var imgv_icon: UIImageView!
  var stv_info: UIStackView!
  var lb_title: UILabel!
  var lb_description: UILabel!
  var iv_center: NVActivityIndicatorView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public weak var delegate: AGStateViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  fileprivate var state: AGStateViewState = .normal
  fileprivate var viewModel: AGStateViewModel.ViewModel = AGStateViewModel.ViewModel()
  fileprivate var axis: NSLayoutConstraint.Axis = .vertical
  
  
  //MARK: - Initial
  
  public init(viewModel: AGStateViewModel.ViewModel, axis: NSLayoutConstraint.Axis) {
    super.init(frame: .zero)
    self.viewModel = viewModel
    self.axis = axis
    onInit()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
    
  }
  
}



//MARK: -  Life Cycle
public extension AGStateView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViewOnAwakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  func onInit() {
    setupUI()
    setupSnp()
    
  }
  
  func onDeinit() {
    
  }
  
}



//MARK: -  Setup UI
public extension AGStateView {
  
  func setupViewOnAwakeFromNib() {
    setupUI()
    setupSnp()
  }
  
  func setupUI() {
    backgroundColor = UIColor.clear
    
    imgv_background = UIImageView()
    imgv_background.backgroundColor = UIColor.clear
    imgv_background.contentMode = .scaleAspectFill
    imgv_background.isUserInteractionEnabled = true
    
    v_top = UIView()
    v_top.backgroundColor = UIColor.clear
    
    imgv_icon = UIImageView()
    imgv_icon.backgroundColor = UIColor.clear
    imgv_icon.contentMode = .scaleAspectFit
    
    stv_info = UIStackView()
    stv_info.backgroundColor = UIColor.clear
    stv_info.axis = .vertical
    stv_info.alignment = .fill
    stv_info.distribution = .fill
    stv_info.spacing = 10
    
    lb_title = UILabel()
    lb_title.text = "title"
    lb_title.textColor = UIColor.darkText
    lb_title.backgroundColor = UIColor.clear
    lb_title.numberOfLines = 0
    lb_title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    
    lb_description = UILabel()
    lb_description.text = "description"
    lb_description.textColor = UIColor.darkText
    lb_description.backgroundColor = UIColor.clear
    lb_description.numberOfLines = 0
    lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    iv_center = NVActivityIndicatorView(frame: .zero, type: .lineScale, color: UIColor.white, padding: nil)
    iv_center.startAnimating()
    
    let tapg = UITapGestureRecognizer(target: self, action: #selector(stateViewPressed(_:)))
    addGestureRecognizer(tapg)
    
    switch axis {
    case .vertical:
      lb_title.textAlignment = .center
      lb_description.textAlignment = .center
    case .horizontal:
      lb_title.textAlignment = .left
      lb_description.textAlignment = .left
    }
    
    addSubview(imgv_background)
    addSubview(v_top)
    v_top.addSubview(imgv_icon)
    addSubview(stv_info)
    addSubview(iv_center)
    
    stv_info.addArrangedSubview(lb_title)
    stv_info.addArrangedSubview(lb_description)
    
    setupEmpty()
    
  }
  
  func setupSnp() {
    
    lb_title.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    lb_description.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    
    imgv_background.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    iv_center.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.1)
      $0.height.equalTo(iv_center.snp.width)
    }
    
    switch axis {
    case .vertical:
      v_top.snp.makeConstraints {
        $0.top.right.left.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.5)
      }
      imgv_icon.snp.makeConstraints {
        $0.bottom.equalToSuperview()
        $0.centerX.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.7)
        $0.width.equalTo(imgv_icon.snp.height)
      }
      stv_info.snp.makeConstraints {
        $0.top.equalTo(v_top.snp.bottom).offset(20)
        $0.bottom.lessThanOrEqualToSuperview().inset(20)
        $0.width.equalToSuperview().multipliedBy(0.8)
        $0.centerX.equalToSuperview()
      }
    case .horizontal:
      v_top.snp.makeConstraints {
        $0.top.bottom.left.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.4)
      }
      imgv_icon.snp.makeConstraints {
        $0.right.equalToSuperview()
        $0.centerY.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.6)
        $0.height.equalTo(imgv_icon.snp.width)
      }
      stv_info.snp.makeConstraints {
        $0.left.equalTo(v_top.snp.right).offset(20)
        $0.right.equalToSuperview().inset(20)
        $0.height.lessThanOrEqualToSuperview().multipliedBy(0.6)
        $0.centerY.equalToSuperview()
      }
    }
    
  }
  
}



//MARK: - Setup Data
public extension AGStateView {
  
}



//MARK: - Event
public extension AGStateView {
  
  @objc
  fileprivate func stateViewPressed(_ sender: UITapGestureRecognizer) {
    delegate?.stateViewPressed(with: self, state: state)
  }
  
}



//MARK: - Public
public extension AGStateView {
  
  public func setStateViewState(with state: AGStateViewState, animated: Bool = false, onComplete: CallbackVoid? = nil) {
    self.state = state
    switch state {
    case .normal:
      hide(with: animated, onComplete: onComplete)
    default:
      show(with: animated, onComplete: onComplete)
    }
    setupData(with: viewModel.getSetting(with: state))
  }
  
}



//MARK: - Private
public extension AGStateView {
  
  private func setupEmpty() {
    imgv_background.image = nil
    iv_center.isHidden = true
    imgv_icon.image = nil
    lb_title.text = ""
    lb_description.text = ""
    alpha = 0
  }
  
  private func show(with animated: Bool = false, onComplete: CallbackVoid? = nil) {
    let duration = animated ? 0.0 : 0.2
    UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve
      , animations: {
        self.alpha = 1
    }, completion: { _ in
    })
    
  }
  
  private func hide(with animated: Bool = false, onComplete: CallbackVoid? = nil) {
    let duration = animated ? 0.0 : 0.2
    UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve
      , animations: {
        self.alpha = 0
    }, completion: { _ in
      onComplete?()
    })
    
  }
  
}



//MARK: - Interaction & Presentation
public extension AGStateView {
  
}



//MARK: - Display
public extension AGStateView {
  
  public func setupData(with setting: AGStateViewModel.Setting) {
    let tint = setting.tint ?? UIColor.black
    
    if let img = setting.bg_image {
      imgv_background.image = img
    } else {
      imgv_background.image = nil
    }
    
    iv_center.isHidden = setting.isIndicatorHidden
    iv_center.color = tint
    if !setting.isIndicatorHidden {
      iv_center.startAnimating()
    }
    
    if let img = setting.image {
      imgv_icon.image = img
    } else {
      imgv_icon.image = nil
    }
    
    lb_title.text = setting.title
    lb_description.text = setting.description
    lb_title.textColor = tint
    lb_description.textColor = tint
    
    if let font = setting.font {
      lb_title.font = font
      lb_description.font = font
    } else {
      lb_title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
      lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
  }
  
}
