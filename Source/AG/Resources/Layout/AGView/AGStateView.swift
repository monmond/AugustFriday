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
  
  public enum State: CaseIterable {
    
    case normal
    case loading
    case noResults
    case noConnection
    case error
    
  }
  
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
    
  }
  
}



//MARK: - AGStateViewDelegate
public protocol AGStateViewDelegate: class {
  func stateViewPressed(with stateView: AGStateView , state: AGStateViewModel.State)
}



//MARK: - AGStateView
public class AGStateView: UIView, AGReusable {
  
  //MARK: - UI
  
  var imgv_background: UIImageView!
  var imgv_icon: UIImageView!
  var lb_title: UILabel!
  var lb_description: UILabel!
  var iv_center: NVActivityIndicatorView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public weak var delegate: AGStateViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  fileprivate var state: AGStateViewModel.State = .normal
  fileprivate var viewModel: AGStateViewModel.ViewModel = AGStateViewModel.ViewModel()
  
  
  //MARK: - Initial
  
  public convenience init(viewModel: AGStateViewModel.ViewModel) {
    self.init(frame: .zero)
    self.viewModel = viewModel
  }
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
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
    
    imgv_icon = UIImageView()
    imgv_icon.backgroundColor = UIColor.clear
    imgv_icon.contentMode = .scaleAspectFit
    
    lb_title = UILabel()
    lb_title.text = "title"
    lb_title.textColor = UIColor.darkText
    lb_title.backgroundColor = UIColor.clear
    lb_title.textAlignment = .center
    lb_title.numberOfLines = 0
    lb_title.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    
    lb_description = UILabel()
    lb_description.text = "description"
    lb_description.textColor = UIColor.darkText
    lb_description.backgroundColor = UIColor.clear
    lb_description.textAlignment = .center
    lb_description.numberOfLines = 0
    lb_description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
    iv_center = NVActivityIndicatorView(frame: .zero, type: .lineScale, color: UIColor.white, padding: nil)
    iv_center.startAnimating()
    
    let tapg = UITapGestureRecognizer(target: self, action: #selector(backgroundImagePressed(_:)))
    imgv_background.addGestureRecognizer(tapg)
    
    addSubview(imgv_background)
    addSubview(imgv_icon)
    addSubview(lb_title)
    addSubview(lb_description)
    addSubview(iv_center)
    
  }
  
  func setupSnp() {
    imgv_background.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    iv_center.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.1)
      $0.height.equalTo(iv_center.snp.width)
    }
    imgv_icon.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(snp.centerY)
      $0.width.equalToSuperview().multipliedBy(0.4)
      $0.height.equalTo(imgv_icon.snp.width)
    }
    lb_title.snp.makeConstraints {
      $0.top.equalTo(imgv_icon.snp.bottom).offset(20)
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.centerX.equalToSuperview()
    }
    lb_description.snp.makeConstraints {
      $0.top.equalTo(lb_title.snp.bottom).offset(15)
      $0.bottom.lessThanOrEqualToSuperview().inset(20)
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.centerX.equalToSuperview()
    }
  }
  
}



//MARK: - Setup Data
public extension AGStateView {
  
}



//MARK: - Event
public extension AGStateView {
  
  @objc
  fileprivate func backgroundImagePressed(_ sender: UITapGestureRecognizer) {
    delegate?.stateViewPressed(with: self, state: state)
  }
  
}



//MARK: - Public
public extension AGStateView {
  
  public func show(isForce: Bool = false) {
    //    curveEaseIn
    let duration = isForce ? 0.0 : 0.1
    UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve
      , animations: {
        self.alpha = 1
    }, completion: { _ in
      
    })
    
  }
  
  public func hide(_ onComplete: CallbackVoid? = nil) {
    UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve
      , animations: {
        self.alpha = 0
    }, completion: { _ in
      onComplete?()
    })
    
  }
  
  public func setState(state: AGStateViewModel.State) {
    self.state = state
    var setting: AGStateViewModel.Setting
    switch state {
    case .normal:
      setting = viewModel.normal
    case .loading:
      setting = viewModel.loading
    case .noResults:
      setting = viewModel.noResults
    case .noConnection:
      setting = viewModel.noConnection
    case .error:
      setting = viewModel.error
    }
    setupData(with: setting)
    
  }
  
  public func show(with state: AGStateViewModel.State, isForce: Bool = false) {
    setState(state: state)
    show(isForce: isForce)
    
  }
  
}



//MARK: - Private
public extension AGStateView {
  
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
    }
    
  }
  
}
