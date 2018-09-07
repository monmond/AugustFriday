//
//  AGAlamofireValidatable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import SwiftyJSON



//MARK: - AGAlamofireValidatable
public protocol AGAlamofireValidatable {
  
  var _status: Bool? { get set }
  var status: Bool { get }
  
  init?(json: JSON?)
  
}