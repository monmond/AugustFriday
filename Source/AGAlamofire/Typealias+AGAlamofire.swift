//
//  Typealias+AGAlamofire.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON



//MARK: - typealias
public typealias TaskIdentifier = Int
public typealias SessionIdentifier = String
public typealias AGURLRequestConvertible = (URLRequestConvertible & AGAlamofireRouter)
public typealias CBJsonOptional = ((JSON?) -> Void)
public typealias CBAGDataResponseJSON = ((AGDataResponse<JSON>) -> Void)
public typealias CBTaskIdentifier = ((TaskIdentifier?) -> Void)


