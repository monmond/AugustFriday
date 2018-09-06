//
//  AGStateView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



public enum AGStateViewModel {
  
  public enum State {
    
    case normal
    case loading
    case noResults
    case noConnection
    case error
    
  }
  
  open class Setting {
    
    public var image: AGAsset?
    public var title: String?
    public var description: String?
    public var isIndicatorHidden: Bool = false
    
    public var tint: AGColor?
    public var bg_color: AGColor?
    public var bg_image: AGAsset?
    
    public var font: AGFont?
    
    public init() {
      
    }
    
    public init(image: AGAsset?,
                title: String?,
                description: String?,
                isIndicatorHidden: Bool = false,
                tint: AGColor?,
                bg_color: AGColor?,
                bg_image: AGAsset?,
                font: AGFont?) {
      self.image = image
      self.title = title
      self.description = description
      self.isIndicatorHidden = isIndicatorHidden
      self.tint = tint
      self.bg_color = bg_color
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



public class AGStateView: UIView, AGReusable {
  
  //MARK: - UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var img_background: UIImageView!
  @IBOutlet weak var stv_center: UIStackView!
  @IBOutlet weak var img_logo: UIImageView!
  @IBOutlet weak var lb_title: UILabel!
  @IBOutlet weak var lb_description: UILabel!
  @IBOutlet weak var iv_center: NVActivityIndicatorView!
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupNib()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    //    setupAutoLayout()
    //    setupView()
  }
  
}



//MARK: -  Life Cycle
public extension AGStateView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupAwakeFromNib()
  }
  
}



//MARK: -  Setup UI
extension AGStateView {
  
  func setupNib() {
    
    Bundle(for: AGStateView.self).ag.loadNibNamed(AGStateView.name, owner: self, options: nil)
    
    // Container
    v_container.translatesAutoresizingMaskIntoConstraints = false
    addSubview(v_container)
    v_container.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    v_container.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    v_container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    v_container.topAnchor.constraint(equalTo: topAnchor).isActive = true
    
    setupView()
    setupNVActivityIndicatorView()
    
    //    // Logo
    //    img_logo = UIImageView(image: LogoAsset.omu_white_large.image)
    //    img_logo.widthAnchor.constraint(equalTo: img_logo.heightAnchor, multiplier: 18/7).isActive = true
    //
    //    // Indicator
    //    iv_center = NVActivityIndicatorView(frame: .zero)
    //
    //
    //    // StackView
    //    stv_center = UIStackView(arrangedSubviews: [])
    //    stv_center.axis = .vertical
    //    stv_center.distribution = .fill
    //    stv_center.alignment = .center
    //    stv_center.spacing = 30
    //    stv_center.addArrangedSubview(img_logo)
    //    stv_center.addArrangedSubview(iv_center)
    //    stv_center.translatesAutoresizingMaskIntoConstraints = false
    //    addSubview(stv_center)
    //
    //    iv_center.widthAnchor.constraint(equalTo: img_logo.heightAnchor, multiplier: 1).isActive = true
    //    img_logo.widthAnchor.constraint(equalTo: stv_center.widthAnchor, multiplier: 0.6).isActive = true
    //    iv_center.widthAnchor.constraint(equalTo: stv_center.widthAnchor, multiplier: 0.3).isActive = true
    //
    //    stv_center.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    //    if #available(iOS 11.0, *) {
    //      stv_center.centerYAnchor.constraintEqualToSystemSpacingBelow(centerYAnchor, multiplier: 0.9).isActive = true
    //    } else {
    //      // Fallback on earlier versions
    //    }
    //    stv_center.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
    
  }
  
  func setupAwakeFromNib() {
    setupView()
    setupNVActivityIndicatorView()
  }
  
  func setupView() {
    backgroundColor = BaseColor.clear.color
    v_container.backgroundColor = BaseColor.clear.color
    img_background.backgroundColor = BaseColor.clear.color
    img_background.contentMode = .scaleAspectFill
  }
  
  func setupNVActivityIndicatorView() {
    iv_center.startAnimating()
  }
  
}



//MARK: -  Display Data
public extension AGStateView {

  public func setupData(with setting: AGStateViewModel.Setting) {
    let tint = setting.tint ?? BaseColor.red_brown
    let bg = setting.bg_color ?? BaseColor.gray_warm
    
    if let img = setting.image {
      img_logo.image = img.image(tint)
    } else {
      img_logo.image = nil
    }
    
    lb_title.text = setting.title
    lb_description.text = setting.description
    lb_title.textColor = tint.color
    lb_description.textColor = tint.color
    if let font = setting.font {
      lb_title.font = font.with(size: lb_title.font.pointSize)
      lb_description.font = font.with(size: lb_description.font.pointSize)
    }
    
    iv_center.isHidden = setting.isIndicatorHidden
    
    v_container.backgroundColor = bg.color
    
    if let img = setting.bg_image {
      img_background.image = img.image
    } else {
      img_background.image = nil
    }
  }

}
