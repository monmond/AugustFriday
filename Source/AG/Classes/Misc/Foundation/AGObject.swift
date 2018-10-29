//
//  AGObject.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGObject
public protocol AGObject {
  
  func mockBackgroundWaiting(_ time: UInt32, onComplete: @escaping CBVoid)
  func mockMainWaiting(_ time: Double, onComplete: @escaping CBVoid)
  
}



//MARK: - Implements
public extension AGObject {
  public func mockBackgroundWaiting(_ time: UInt32 = 3, onComplete: @escaping CBVoid) {
    let qualityOfServiceClass = DispatchQoS.QoSClass.background
    let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
    backgroundQueue.async {
      sleep(time)
      DispatchQueue.main.async {
        onComplete()
      }
    }
  }
  public func mockMainWaiting(_ time: Double = 3.0, onComplete: @escaping CBVoid) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
      onComplete()
    }
  }
}
