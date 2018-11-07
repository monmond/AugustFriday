//
//  AGLoadView.swift
//  AugustFriday
//
//  Created by Sasawat Sankosik on 7/11/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import NVActivityIndicatorView
import SnapKit



//MARK: - AGLoadVM
public enum AGLoadVM {

  public class ViewModel {
    
    public var image: UIImage?
    public var isIndicatorHidden: Bool = false
    public var tint: UIColor?
    public var bg_image: UIImage?
    
    public init() {
      
    }
    
    public init(image: UIImage?,
                isIndicatorHidden: Bool,
                tint: UIColor?,
                bg_image: UIImage?) {
      self.image = image
      self.isIndicatorHidden = isIndicatorHidden
      self.tint = tint
      self.bg_image = bg_image
    }
    
  }

}



//MARK: - AGLoadView
public class AGLoadView: UIView, AGReusable {

  //MARK: - UI
  var imgv_background: UIImageView!
  var stv_center: UIStackView!
  var imgv_icon: UIImageView!
  var iv_center: NVActivityIndicatorView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public weak var delegate: AGStateViewDelegate?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  fileprivate var state: AGStateViewState = .normal
  fileprivate var viewModel: AGStateVM.ViewModel = AGStateVM.ViewModel()
  
  
  
  //MARK: - Initial
  public init(viewModel: AGStateVM.ViewModel, axis: NSLayoutConstraint.Axis) {
    super.init(frame: .zero)
    self.viewModel = viewModel
    onInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: -  Life Cycle
  override public func awakeFromNib() {
    super.awakeFromNib()
    setupViewOnAwakeFromNib()
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  func onInit() {
    setupUI()
    setupSnp()
    
  }
  
  func onDeinit() {
    
  }
  
  
  
  //MARK: -  Setup UI
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
    
    stv_center = UIStackView()
    stv_center.backgroundColor = UIColor.clear
    stv_center.axis = .vertical
    stv_center.alignment = .center
    stv_center.distribution = .fill
    stv_center.spacing = 30
    
    imgv_icon = UIImageView()
    imgv_icon.backgroundColor = UIColor.clear
    imgv_icon.contentMode = .scaleAspectFit
    
    iv_center = NVActivityIndicatorView(frame: .zero, type: .lineScale, color: UIColor.white, padding: nil)
    iv_center.startAnimating()
    
    addSubview(imgv_background)
    addSubview(stv_center)
    stv_center.addArrangedSubview(imgv_icon)
    stv_center.addArrangedSubview(iv_center)
    
    setupEmpty()
    
  }
  
  func setupSnp() {
    imgv_background.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }
    stv_center.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.4)
    }
    imgv_icon.snp.makeConstraints {
      $0.width.equalToSuperview().multipliedBy(0.6)
      $0.height.equalTo(imgv_icon.snp.width)
    }
    iv_center.snp.makeConstraints {
      $0.width.equalToSuperview().multipliedBy(0.3)
      $0.height.equalTo(iv_center.snp.width)
    }
  }
  
  
  
  //MARK: - Setup Data
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  private func setupEmpty() {
    imgv_background.image = nil
    iv_center.isHidden = true
    imgv_icon.image = nil
    alpha = 0
  }
  
  
  
  //MARK: - Interaction & Presentation
  
  
  
  //MARK: - Display
  public func setupData(with setting: AGLoadVM.ViewModel) {
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
    
    
  }
  
}
