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
public typealias AGURLRequestConvertible = (URLRequestConvertible & AGRouter)
public typealias CallbackJsonOptional = ((JSON?) -> Void)
public typealias CallbackAGResponseJSON = ((AGResponse<JSON>) -> Void)
public typealias TaskIdentifier = Int
public typealias CallbackTaskIdentifier = ((TaskIdentifier?) -> Void)
