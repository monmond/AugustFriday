//
//  ApplicationWindow.swift
//  atimemedia
//
//  Created by sasawat sankosik on 10/9/18.
//  Copyright © 2018 gmm. All rights reserved.
//



import UIKit



public protocol AGVipDataPassing: class {
  var ds_ag: AGVipDataStore? { get }
}



open class AGVipRouter: NSObject, AGVipRoutingLogic, AGVipDataPassing {
  
  //MARK: - VIP
  public weak var vc_ag: AGVipVC?
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  private var app_delegate: UIApplicationDelegate? {
    return UIApplication.shared.delegate
  }
  public var window: UIWindow? {
    return app_delegate?.window ?? nil
  }
  public var ds_ag: AGVipDataStore?
  
  
  
  //MARK: - Initial
  public override init() {
    
  }
  
  deinit {
    
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
  
}

