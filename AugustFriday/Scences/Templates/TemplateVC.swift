//
//  TemplateVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 3/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Extensions
extension TemplateVC: AGVCInstantiatable { }



//MARK: - TemplateVC
class TemplateVC: UIViewController {
  //MARK: - AGInstantiatable
  static var sb_name: String = "Template"
  static var vc_name: String = "TemplateVC"
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
extension TemplateVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  func onInit() {
    
  }
  
  func onDeinit() {
    
  }
  
}



//MARK: - Setup View
extension TemplateVC {
  
  func setupViewOnViewDidLoad() {
    
  }
  
  func setupUI() {
    
  }
  
  func setupSnp() {
    
  }
  
}



//MARK: - Setup Data
extension TemplateVC {
  
  func setupDataOnViewDidLoad() {
    
  }
  
}



//MARK: - Event
extension TemplateVC {
  
}



//MARK: - Public
extension TemplateVC {
  
}



//MARK: - Private
extension TemplateVC {
  
}



//MARK: - Interaction & Presentation
extension TemplateVC {
  
}



//MARK: - Display
extension TemplateVC {
  
}



//MARK: - Core - Protocol
extension TemplateVC {
  
}



//MARK: - Custom - Protocol
extension TemplateVC {
  
}



//MARK: - Pods - Protocol
extension TemplateVC {
  
}




