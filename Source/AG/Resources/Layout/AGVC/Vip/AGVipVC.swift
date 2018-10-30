//
//  AGVipVC.swift
//  atimemedia
//
//  Created by sasawat sankosik on 4/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVipVC
open class AGVipVC: AGVC, AGVipDisplayLogic {
  
  //MARK: - Clean-Swift
  public var i_ag: AGVipBussinessLogic?
  public var r_ag: (NSObjectProtocol & AGVipRoutingLogic & AGVipDataPassing)?
  
  
  
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
  
  
  
}



//MARK: - Implements
public extension AGVipVC {
  
  public func displaySomeThing(viewModel: String) {
    AGLog.info(viewModel)
  }
  
  public func displaySomeThingPassed(viewModel: String) {
    AGLog.info(viewModel)
  }
  
  public func displaySomeThingError() {
    AGLog.info()
    let vm = AGNotificationBannerVM(title: "title", subtitle: #function, style: .info, position: .top)
    displayStatusBarNotificationBanner(vm, on: self)
  }
  
}



//MARK: - Commons
public extension AGVipVC {

}


