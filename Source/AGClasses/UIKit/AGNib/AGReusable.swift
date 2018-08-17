//
//  ReusebleCell.swift
//  AugestFriday
//
//  Created by sasawat sankosik on 10/1/17.
//  Copyright © 2017 ssankosik. All rights reserved.
//



import UIKit



public protocol AGReusable {
  
  static var name: String { get }
  static var reuseId: String { get }
  
}



public extension AGReusable {
  
  public static var name: String {
    return String(describing: self)
  }
  
  public static var reuseId: String {
    return String(describing: self)
  }
  
}







