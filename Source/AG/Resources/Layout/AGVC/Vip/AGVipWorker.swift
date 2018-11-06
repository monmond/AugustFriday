//
//  AGVipWorker.swift
//  atimemedia
//
//  Created by sasawat sankosik on 4/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVipWorker
open class AGVipWorker {
  
  //MARK: - Initial
  public init() {
    
  }
  
  deinit {
    
  }

  
}



//MARK: - Implements
public extension AGVipWorker {
  
  public func fetchSomeThing(onComplete: @escaping (AGDataResponse<String?>) -> ()) {
    onComplete(AGDataResponse<String?>(data: "SomeThing", error: nil))
  }
  
}