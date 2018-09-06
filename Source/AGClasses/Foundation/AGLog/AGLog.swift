//
//  AGLog.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



public enum AGLogLevel: Int {
  
  case off = 0, error, warning, info, debug
  
  func description() -> String {
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



open class AGLog: NSObject {
  
  fileprivate static var logLevel = AGLogLevel.info
  
  open class func setLevel(_ level: AGLogLevel) {
    logLevel = level
    
  }
  
  fileprivate class func log(_ level: AGLogLevel, message: String) {
    if level.rawValue <= logLevel.rawValue {
      print("\(level.description()) \(message)")
    }
    
  }
  
  fileprivate class func log<T>(_ level: AGLogLevel, scope: T.Type?, message: String) {
    if let scope = scope {
      let reflecting: String = String(reflecting: scope).lazy.split(separator: ".").dropFirst().joined(separator: ".")
      log(level, message: "[\(reflecting)] \(message)")
    } else {
      log(level, message: message)
    }
    
  }
  
  open class func error<T>(_ message: String, scope: T.Type? = nil) {
    log(.error, scope: scope, message: message)
    
  }
  
  open class func warn<T>(_ message: String, scope: T.Type? = nil) {
    log(.warning, scope: scope, message: message)
    
  }
  
  open class func info<T>(_ message: String, scope: T.Type? = nil) {
    log(.info, scope: scope, message: message)
    
  }
  
  open class func debug<T>(_ message: String, scope: T.Type? = nil) {
    log(.debug, scope: scope, message: message)
    
  }
  
}
