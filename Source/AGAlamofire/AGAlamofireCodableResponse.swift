//
//  AGAlamofireCodableResponse.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 10/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - AGAlamofireCodableResponse
public protocol AGAlamofireCodableResponse: Codable {
  
  var _operation_status: AGOperationStatus? { get set }
  var operation_status: AGOperationStatus { get }
  
}
