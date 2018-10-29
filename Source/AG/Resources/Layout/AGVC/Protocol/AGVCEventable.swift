//
//  AGObservableVC.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGVCEvent
public enum AGVCEvent {
  
  case didLoad
  case willAppear
  case didAppear
  case willDisappear
  case didDisappear
  
}



//MARK: - AGEventVC
public protocol AGVCEventable: class {
  
  var isDidLoadCalled: Bool { get set }
  var isWillAppearCalled: Bool { get set }
  var isDidAppearCalled: Bool { get set }
  var isWillDisappearCalled: Bool { get set }
  var isDidDisappearCalled: Bool { get set }
  
  var onDidLoad: LDVoid? { get set }
  var onWillAppear: LDVoid? { get set }
  var onDidAppear: LDVoid? { get set }
  var onWillDisappear: LDVoid? { get set }
  var onDidDisappear: LDVoid? { get set }
  
  func observe(on event: AGVCEvent, context: @escaping LDVoid)
  func trigger(on event: AGVCEvent)
  func eventVCReset()
  
}



//MARK: - Implements
public extension AGVCEventable {
  
  public func observe(on event: AGVCEvent, context: @escaping LDVoid) {
    switch event {
    case .didLoad:
      onDidLoad = context
    case .willAppear:
      onWillAppear = context
    case .didAppear:
      onDidAppear = context
    case .willDisappear:
      onWillDisappear = context
    case .didDisappear:
      onDidDisappear = context
    }
    
  }
  
  public func trigger(on event: AGVCEvent) {
    switch event {
    case .didLoad:
      isDidLoadCalled = true
      onDidLoad?()
      onDidLoad = nil
    case .willAppear:
      isWillAppearCalled = true
      onWillAppear?()
      onWillAppear = nil
    case .didAppear:
      isDidAppearCalled = true
      onDidAppear?()
      onDidAppear = nil
    case .willDisappear:
      isWillDisappearCalled = true
      onWillDisappear?()
      onWillDisappear = nil
    case .didDisappear:
      isWillDisappearCalled = true
      onDidDisappear?()
      onDidDisappear = nil
    }
    
  }
  
  public func eventVCReset() -> Void {
    isDidLoadCalled = false
    isWillAppearCalled = false
    isDidAppearCalled = false
    isWillDisappearCalled = false
    isDidDisappearCalled = false
    onWillAppear = nil
    onDidAppear = nil
    onDidLoad = nil
    onWillDisappear = nil
    onDidDisappear = nil
    
  }
  
}

