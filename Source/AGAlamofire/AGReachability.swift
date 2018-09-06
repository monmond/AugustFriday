//
//  AGReachability.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Alamofire
import SystemConfiguration



//MARK: - AGReachability
public class AGReachability: NSObject {
  
  private var networkReachability: SCNetworkReachability?
  private var notifying: Bool = false
  
  public var isReachable: Bool {
    switch currentReachabilityStatus {
    case .notReachable:
      return false
    case .reachableViaWiFi, .reachableViaWWAN:
      return true
    }
  }
  
  private var flags: SCNetworkReachabilityFlags {
    var flags = SCNetworkReachabilityFlags(rawValue: 0)
    if let reachability = networkReachability, withUnsafeMutablePointer(to: &flags, { SCNetworkReachabilityGetFlags(reachability, UnsafeMutablePointer($0)) }) == true {
      return flags
    }
    else {
      return []
    }
  }
  
  public var currentReachabilityStatus: AGReachabilityStatus {
    
    if !flags.contains(.reachable) {
      // The target host is not reachable.
      return .notReachable
      
    } else if flags.contains(.isWWAN) {
      // WWAN connections are OK if the calling application is using the CFNetwork APIs.
      return .reachableViaWWAN
      
    } else if !flags.contains(.connectionRequired) {
      // If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi...
      return .reachableViaWiFi
      
    } else if (flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)) && !flags.contains(.interventionRequired) {
      // The connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs and no [user] intervention is needed
      return .reachableViaWiFi
      
    } else {
      return .notReachable
      
    }
  }
  
  public init?(hostName: String) {
    networkReachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, (hostName as NSString).utf8String!)
    super.init()
    if networkReachability == nil {
      return nil
    }
  }
  
  public init?(hostAddress: sockaddr_in) {
    var address = hostAddress
    
    guard let defaultRouteReachability = withUnsafePointer(to: &address, {
      $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
        SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, $0)
      }
    }) else {
      return nil
    }
    
    networkReachability = defaultRouteReachability
    
    super.init()
    if networkReachability == nil {
      return nil
    }
  }
  
  public func startNotifier() -> Bool {
    
    guard notifying == false else {
      return false
    }
    
    var context = SCNetworkReachabilityContext()
    context.info = UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque())
    
    guard let reachability = networkReachability, SCNetworkReachabilitySetCallback(reachability, { (target: SCNetworkReachability, flags: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) in
      if let currentInfo = info {
        let infoObject = Unmanaged<AnyObject>.fromOpaque(currentInfo).takeUnretainedValue()
        if infoObject is AGReachability {
          let networkReachability = infoObject as! AGReachability
          NotificationCenter.default.post(name: .reachabilityDidChange, object: networkReachability)
        }
      }
    }, &context) == true else { return false }
    
    guard SCNetworkReachabilityScheduleWithRunLoop(reachability, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue) == true else { return false }
    
    notifying = true
    return notifying
  }
  
  public func stopNotifier() {
    if let reachability = networkReachability, notifying == true {
      SCNetworkReachabilityUnscheduleFromRunLoop(reachability, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode as! CFString)
      notifying = false
    }
  }
  
  deinit {
    stopNotifier()
  }
  
  public static func networkReachabilityForInternetConnection() -> AGReachability? {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    return AGReachability(hostAddress: zeroAddress)
    
  }
  
  public static func networkReachabilityForLocalWiFi() -> AGReachability? {
    var localWifiAddress = sockaddr_in()
    localWifiAddress.sin_len = UInt8(MemoryLayout.size(ofValue: localWifiAddress))
    localWifiAddress.sin_family = sa_family_t(AF_INET)
    // IN_LINKLOCALNETNUM is defined in <netinet/in.h> as 169.254.0.0 (0xA9FE0000).
    localWifiAddress.sin_addr.s_addr = 0xA9FE0000
    return AGReachability(hostAddress: localWifiAddress)
    
  }
  
}
