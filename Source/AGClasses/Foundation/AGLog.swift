//
//  AGLog.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGLogLevel
public enum AGLogLevel: Int {
  
  case off = 0, error, warning, info, debug
  
  public func description() -> String {
    switch self {
    case .debug:
      return "DEBUG"
    case .info:
      return "INFO"
    case .warning:
      return "WARNING"
    case .error:
      return "ERROR"
    default:
      return ""
    }
    
  }
  
}



//MARK: - AGLog
open class AGLog: NSObject {
  
  fileprivate class func log(_ level: AGLogLevel, message: Any) {
    if level.rawValue <= AGLogConfiguration.shared.logLevel.rawValue {
      print("\(level.description()) \(message)")
    }
    
  }
  
  fileprivate class func log<T>(_ level: AGLogLevel, scope: T.Type, message: Any) {
    let reflecting: String = String(reflecting: scope).lazy.split(separator: ".").dropFirst().joined(separator: ".")
    log(level, message: "[\(reflecting)] \(message)")
    
  }
  
  open class func error<T>(_ message: Any, scope: T.Type) {
    log(.error, scope: scope, message: message)
    
  }
  
  open class func warn<T>(_ message: Any, scope: T.Type) {
    log(.warning, scope: scope, message: message)
    
  }
  
  open class func info<T>(_ message: Any, scope: T.Type) {
    log(.info, scope: scope, message: message)
    
  }
  
  open class func debug<T>(_ message: Any, scope: T.Type) {
    log(.debug, scope: scope, message: message)
    
  }
  
  open class func error(_ message: Any) {
    log(.debug, message: message)
    
  }
  
  open class func warn(_ message: Any) {
    log(.warning, message: message)
    
  }
  
  open class func info(_ message: Any) {
    log(.info, message: message)
    
  }
  
  open class func debug(_ message: Any) {
    log(.debug, message: message)
    
  }
  
}
