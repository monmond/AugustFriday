//
//  AGNetworkManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Alamofire
import SystemConfiguration



/*
 
 private ip, public domain get by login
 
 */



//MARK: - AGNetworkManager
public class AGNetworkManager {
  
  /*
   let host = "www.google.com"
   let host = "www.apple.com"
   let host = "http://192.168.1.35/"
   */
  public var status: NetworkReachabilityManager.NetworkReachabilityStatus = .unknown
  public var reachability: AGReachability?
  
  public static let shared = AGNetworkManager()
  
  private init() {
    reachability = AGReachability.networkReachabilityForInternetConnection()
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(reachabilityDidChange),
                                           name: .reachabilityDidChange,
                                           object: nil)
    _ = reachability?.startNotifier()
    
  }
  
  private var ping: NetworkReachabilityManager? = {
    let host = "www.google.com"
    let reachabilityManager = Alamofire.NetworkReachabilityManager(host: host)
    reachabilityManager?.listener = { status in
      switch status {
      case .notReachable:
        AGNetworkManager.postReachableObserver(.notReachable)
      case .unknown:
        AGNetworkManager.postUnreachableObserver(.unknown)
      case .reachable(.ethernetOrWiFi):
        AGNetworkManager.postReachableObserver(.reachable(.ethernetOrWiFi))
      case .reachable(.wwan):
        AGNetworkManager.postReachableObserver(.reachable(.wwan))
      }
    }
    return reachabilityManager
  }()
  
  public func startListening() {
    ping?.startListening()
  }
  
  public func stopListening() {
    ping?.stopListening()
  }
  
  public static func postReachableObserver(_ status: NetworkReachabilityManager.NetworkReachabilityStatus) {
    NotificationCenter.default.post(name: .reachable, object: nil, userInfo: ["status":status])
  }
  
  public static func postUnreachableObserver(_ status: NetworkReachabilityManager.NetworkReachabilityStatus) {
    NotificationCenter.default.post(name: .unreachable, object: nil, userInfo: ["status":status])
  }
  
  @objc
  public func reachabilityDidChange() {
    
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
    reachability?.stopNotifier()
    
  }
  
}
