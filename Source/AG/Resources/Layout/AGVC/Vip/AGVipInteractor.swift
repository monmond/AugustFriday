//
//  AGVipInteractor.swift
//  atimemedia
//
//  Created by sasawat sankosik on 17/9/18.
//  Copyright © 2018 gmm. All rights reserved.
//



import UIKit



public protocol AGVipDataStore: class {
  
  var someThing: String? { get set }
  
}



open class AGVipInteractor: AGObject, AGVipBussinessLogic, AGVipDataStore {
  
  //MARK: - Storage
  public var p_ag: AGVipPresentationLogic?
  public var w_ag: AGVipWorker? = AGVipWorker()
  
  
  //MARK: - Initial
  
  
  
  
  //MARK: - VIP
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  public var someThing: String?
  
  
  
  //MARK: - Initial
  public init() {
    
  }
  
  deinit {
    
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  
  
  
  //MARK: - VIP - UseCase
  open func fetchSomeThing() {
    w_ag?.fetchSomeThing { [weak self] response in
      guard let _s = self else { return }
      self?.mockBackgroundWaiting { [weak self] in
        self?.someThing = response.data ?? nil
        self?.p_ag?.presentSomeThing(response: _s.someThing)
      }
    }
  }
  
  open func fetchSomeThingPassed() {
    p_ag?.presentSomeThingPassed(response: someThing)
  }
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
