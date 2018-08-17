//
//  AGLoadingView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



public enum AGLoadingViewModel {
  
  open class ViewModel {
    public var image: AGAsset?
    
    public init() {
      
    }
    
    public init(image: AGAsset?) {
      self.image = image
    }
    
  }
  
}



public class AGLoadingView: UIView, AGReusable {
  
  //MARK: UI
  @IBOutlet weak var v_container: UIView!
  @IBOutlet weak var stv_center: UIStackView!
  @IBOutlet weak var img_logo: UIImageView!
  @IBOutlet weak var iv_center: NVActivityIndicatorView!
  
  
  //MARK: Constraint
  
  
  
  //MARK: Instance
  
  
  
  //MARK: Storage
  
  
  
  //MARK: Event
  
  
  
  //MARK: Initial
  
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


//MARK: - Life Cycle
public extension AGLoadingView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupAwakeFromNib()
  }
  
}


//MARK: - Setup UI
public extension AGLoadingView {
  
  func setupNib() {
    
    Bundle(for: AGLoadingView.self).ag.loadNibNamed(AGLoadingView.name, owner: self, options: nil)
    
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
  }
  
  func setupNVActivityIndicatorView() {
    iv_center.startAnimating()
  }
  
}



//MARK: - Display Data
public extension AGLoadingView {
  
  public func setupData(with viewModel: AGLoadingViewModel.ViewModel) {
    if let img = viewModel.image {
      img_logo.image = img.image
    } else {
      img_logo.image = nil
    }
  }
  
}


