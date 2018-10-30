//
//  ApplicationWindow.swift
//  atimemedia
//
//  Created by sasawat sankosik on 10/9/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVipDataPassing
public protocol AGVipDataPassing: class {
  
  var ds_ag: AGVipDataStore? { get }
  
}



//MARK: - AGVipRouter
open class AGVipRouter: NSObject, AGVipRoutingLogic, AGVipDataPassing {
  
  //MARK: - Clean-Swift
  public weak var vc_ag: AGVipVC?
  
  
  
  //MARK: - Storage
  public var ds_ag: AGVipDataStore?

  
  
  //MARK: - Initial
  public override init() {
    
  }
  
  deinit {
    
  }

}



//MARK: Implements
public extension AGVipRouter {
  
}



//MARK: - Commons
public extension AGVipRouter {
  
  private var app_delegate: UIApplicationDelegate? {
    return UIApplication.shared.delegate
  }
  
  public var window: UIWindow? {
    return app_delegate?.window ?? nil
  }
  
}
