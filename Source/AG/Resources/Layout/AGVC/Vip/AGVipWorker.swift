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
  
}



//MARK: - Implements
public extension AGVipWorker {
  
  func fetchSomeThing(onComplete: @escaping (AGDataResponse<String?>) -> ()) {
    onComplete(AGDataResponse<String?>(data: "SomeThing", error: nil))
  }
  
}
