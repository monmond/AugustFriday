//
//  AGVipPresenter.swift
//  atimemedia
//
//  Created by sasawat sankosik on 4/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



import UIKit



open class AGVipPresenter: AGVipPresentationLogic {

  //MARK: - VIP
  public weak var vc_ag: AGVipDisplayLogic?
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  public init() {
    
  }
  
  deinit {
    
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  open func presentSomeThing(response: String?) {
    if let r = response {
      vc_ag?.displaySomeThing(viewModel: r)
    } else {
      vc_ag?.displaySomeThingError()
    }
  }
  
  open func presentSomeThingPassed(response: String?) {
    if let r = response {
      vc_ag?.displaySomeThing(viewModel: r)
    } else {
      vc_ag?.displaySomeThingError()
    }
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
