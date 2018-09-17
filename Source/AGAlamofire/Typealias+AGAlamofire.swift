//
//  Typealias+AGAlamofire.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Alamofire
import SwiftyJSON



//MARK: - typealias
public typealias TaskIdentifier = Int
public typealias SessionIdentifier = String
public typealias AGURLRequestConvertible = (URLRequestConvertible & AGAlamofireRouter)
public typealias CallbackJsonOptional = ((JSON?) -> Void)
public typealias CallbackAGAlamofireResponseJSON = ((AGAlamofireResponse<JSON>) -> Void)
public typealias CallbackTaskIdentifier = ((TaskIdentifier?) -> Void)

