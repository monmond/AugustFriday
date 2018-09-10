//
//  MainVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - Extensions
extension MainVC: AGVCInstantiatable { }



//MARK: - MainVC
class MainVC: AGVC {
  //MARK: - AGInstantiatable
  static var sb_name: String = "Main"
  static var vc_name: String = "MainVC"
  
  
  //MARK: - UI
  @IBOutlet weak var btn_retry: UIButton!
  @IBOutlet weak var btn_cancle: UIButton!
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
    
  }
  
}



//MARK: - Life cycle
extension MainVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    
  }
  
}



//MARK: - Setup View
extension MainVC {
  
  fileprivate func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
    
  }
  
  fileprivate func setupUI() {
    btn_retry.addTarget(self, action: #selector(retryButtonPressed), for: .touchUpInside)
    btn_cancle.addTarget(self, action: #selector(cancleButtonPressed), for: .touchUpInside)
    
  }
  
  fileprivate func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension MainVC {
  
  fileprivate func setupDataOnViewDidLoad() {
    fetchTest()
  }
  
}



//MARK: - Event
extension MainVC {
  
  @objc
  func retryButtonPressed() {
    fetchTest()
  }
  
  @objc
  func cancleButtonPressed() {
    AGAlamofireManager.shared.cancelSession(with: "Main")
    
  }
  
}



//MARK: - Public
extension MainVC {
  
}



//MARK: - Private
extension MainVC {
  
}



//MARK: - Interaction & Presentation
extension MainVC {
  
  func fetchTest() {
    
    let param = GetAvatar.Request()
    AvatarApi.getAvatar(param) {
      switch $0.result {
      case let .success(d):
        AGLog.info("\(#function) success \(d)", scope: MainVC.self)
      case let .failure(e):
        AGLog.info("\(#function) failure \(e)", scope: MainVC.self)
      }
    }
  }
  
}



//MARK: - Display
extension MainVC {
  
}



//MARK: - Core - Protocol
extension MainVC {
  
}



//MARK: - Custom - Protocol
extension MainVC {
  
}



//MARK: - Pods - Protocol
extension MainVC {
  
}



