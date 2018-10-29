//
//  InstantiatableController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



public protocol AGVCInstantiatable {
  
  static var sb_name: String { get }
  static var vc_name: String { get }
  static var sb: UIStoryboard { get }
  static func create() -> Self
  
}



public extension AGVCInstantiatable {
  
  public static var sb_name: String {
    return ""
  }
  
  public static var vc_name: String {
    return ""
  }
  
  public static var sb: UIStoryboard {
    return UIStoryboard(name: sb_name, bundle: nil)
  }
  
}


public extension AGVCInstantiatable where Self: UIViewController {
  
  public static func create() -> Self {
    let vc = sb.instantiateViewController(withIdentifier: vc_name)
    return vc as! Self
  }
  
  public static var vc: Self {
    let vc = create()
    return vc
  }
  
  public static var nvc: UINavigationController {
    let vc = create()
    let nvc = UINavigationController(rootViewController: vc)
    return nvc
  }
  
}

