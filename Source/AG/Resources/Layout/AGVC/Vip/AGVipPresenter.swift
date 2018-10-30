//
//  AGVipPresenter.swift
//  atimemedia
//
//  Created by sasawat sankosik on 4/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVipPresenter
open class AGVipPresenter: AGVipPresentationLogic {
  
  //MARK: - Clean-Swift
  public weak var vc_ag: AGVipDisplayLogic?
  
  
  
  //MARK: - Initial
  public init() {
    
  }
  
  deinit {
    
  }

}



//MARK: Implements
public extension AGVipPresenter {
  
  public func presentSomeThing(response: String?) {
    if let r = response {
      vc_ag?.displaySomeThing(viewModel: r)
    } else {
      vc_ag?.displaySomeThingError()
    }
  }
  
  public func presentSomeThingPassed(response: String?) {
    if let r = response {
      vc_ag?.displaySomeThing(viewModel: r)
    } else {
      vc_ag?.displaySomeThingError()
    }
  }
  
}



//MARK: - Commons
extension AGVipPresenter {
  
}
