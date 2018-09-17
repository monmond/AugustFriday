//
//  AGHeaderHFV.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 14/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import SnapKit


//MARK: - AGHeaderHFVDelegate
protocol AGHeaderHFVDelegate: class {
  func agHeaderReusableDidSelect(section: Int)
}


//MARK: - Extensions
extension AGHeaderHFV { }



//MARK: - AGHeaderHFV
class AGHeaderHFV: AGTableViewHeaderFooterView {
  //MARK: - Size
  static var height: CGFloat = 44
  
  
  //MARK: - UI
  var v_container: UIView!
  var lb_title: UILabel!
  var switch_status: UISwitch!
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  weak var delegate: AGHeaderHFVDelegate?
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(reuseIdentifier: AGHeaderHFV.name)
    
  }
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
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





//MARK: - Life cycle
extension AGHeaderHFV {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupViewOnAwakeFromNib()
    
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
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



//MARK: - Setup View
extension AGHeaderHFV {
  
  func setupViewOnAwakeFromNib() {
    setupUI()
    setupSnp()
    
  }
  
  func setupUI() {
//    backgroundColor = .white

    v_container = UIView()
    v_container.backgroundColor = .gray
    v_container.clipsToBounds = true
    addSubview(v_container)
    
    lb_title = UILabel()
    lb_title.textColor = .white
    lb_title.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    lb_title.text = ""
    v_container.addSubview(lb_title)
    
    switch_status = UISwitch()
    switch_status.addTarget(self, action: #selector(switchStatusTapped), for: .touchUpInside)
    switch_status.addTarget(self, action: #selector(switchStatusValueChanged), for:.valueChanged)
    
    v_container.addSubview(switch_status)

  }
  
  func setupSnp() {
    v_container.snp.makeConstraints {
      $0.top.right.bottom.left.equalToSuperview()
    }

    lb_title.snp.makeConstraints { [weak self] lb in
      guard let _s = self else { return }
      lb.top.bottom.equalToSuperview()
      lb.left.equalTo(10)
      lb.right.equalTo(_s.switch_status.snp.left).inset(10)
    }
    
    switch_status.snp.makeConstraints {
//      imgv.height.width.equalTo(_s.v_container.snp.height).multipliedBy(0.5)
      $0.right.equalToSuperview().inset(10)
      $0.centerY.equalToSuperview()
    }
    
  }
  
}



//MARK: - Setup Data
extension AGHeaderHFV {
  
  func setupDataOnViewDidLoad() {
    
  }
  
  func setupData(with isCollpase: Bool) {
    switch_status.isOn = !isCollpase
  }
  
}



//MARK: - Event
extension AGHeaderHFV {
 
  @objc
  func switchStatusTapped(_ sender: UISwitch) {
    switch_status.isOn = !switch_status.isOn
  }
  
  @objc
  func switchStatusValueChanged(_ sender: UISwitch) {
    delegate?.agHeaderReusableDidSelect(section: tag)
  }
  
}



//MARK: - Public
extension AGHeaderHFV {
  
}



//MARK: - Private
extension AGHeaderHFV {
  
}



//MARK: - Interaction & Presentation
extension AGHeaderHFV {
  
}



//MARK: - Display
extension AGHeaderHFV {
  
}



//MARK: - Core - Protocol
extension AGHeaderHFV {
  
}



//MARK: - Custom - Protocol
extension AGHeaderHFV {
  
}



//MARK: - Pods - Protocol
extension AGHeaderHFV {
  
}





