//
//  AGVipInteractor.swift
//  atimemedia
//
//  Created by sasawat sankosik on 17/9/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVipDataStore
public protocol AGVipDataStore: class {
  
  var someThing: String? { get set }
  
}



//MARK: - AGVipInteractor
open class AGVipInteractor: AGObject, AGVipBussinessLogic, AGVipDataStore {
  
  //MARK: - Clean-Swift
  public var p_ag: AGVipPresentationLogic?
  public var w_ag: AGVipWorker? = AGVipWorker()
  
  
  //MARK: - Storage
  public var someThing: String?
  
  
  //MARK: - Initial
  deinit {
    
  }
  
}



//MARK: - Implements
public extension AGVipInteractor {
  
  public func fetchSomeThing() {
    w_ag?.fetchSomeThing { [weak self] response in
      guard let _s = self else { return }
      self?.mockBackgroundWaiting { [weak self] in
        self?.someThing = response.data ?? nil
        self?.p_ag?.presentSomeThing(response: _s.someThing)
      }
    }
  }
  
  public func fetchSomeThingPassed() {
    p_ag?.presentSomeThingPassed(response: someThing)
  }
  
}



//MARK: - Commons
public extension AGVipInteractor {
  
  
  
}
