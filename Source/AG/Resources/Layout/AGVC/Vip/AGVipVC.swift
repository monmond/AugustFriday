//
//  AGVipVC.swift
//  atimemedia
//
//  Created by sasawat sankosik on 4/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



import UIKit



open class AGVipVC: AGVC, AGVipDisplayLogic {
  
  //MARK: - VIP
  public var i_ag: AGVipBussinessLogic?
  public var r_ag: (NSObjectProtocol & AGVipRoutingLogic & AGVipDataPassing)?
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  deinit {
    
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  open func displaySomeThing(viewModel: String) {
    AGLog.info(viewModel)
  }
  
  open func displaySomeThingPassed(viewModel: String) {
    AGLog.info(viewModel)
  }
  
  open func displaySomeThingError() {
    AGLog.info()
    //    let vm = AGNotificationBannerVM(title: "title", subtitle: #function, style: .info, position: .top)
    //    displayStatusBarNotificationBanner(vm, on: self)
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}


