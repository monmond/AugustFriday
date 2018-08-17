//
//  InstantiatableController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public protocol AGInstantiatable {
  
  static var sb_name: String { get }
  static var vc_name: String { get }
  static var sb: UIStoryboard { get }
  static var vc: UIViewController { get }
  
  typealias Setup = ((Self) -> Swift.Void)
  var onViewDidLoad: LambdaVoid? { get set }
  var onViewWillAppear: LambdaVoid? { get set }
  var onViewDidAppear: LambdaVoid? { get set }
  static func create() -> Self
  
}



public extension AGInstantiatable {
  
  public static var sb_name: String {
    return ""
  }
  
  public static var vc_name: String {
    return ""
  }
  
  public static var sb: UIStoryboard {
    return UIStoryboard(name: sb_name, bundle: nil)
  }
  
  public static var vc: UIViewController {
    return sb.instantiateViewController(withIdentifier: vc_name)
  }
  
}


public extension AGInstantiatable where Self: UIViewController {
  
  public static func create() -> Self {
    let vc = sb.instantiateViewController(withIdentifier: vc_name)
    return vc as! Self
  }
  
  public static func vc(setup: Setup?) -> Self {
    let vc = create()
    setup?(vc)
    return vc
  }
  
  public static func nvc(setup: Setup?) -> UINavigationController {
    let vc = create()
    setup?(vc)
    let nvc = UINavigationController(rootViewController: vc)
    return nvc
  }
  
}

