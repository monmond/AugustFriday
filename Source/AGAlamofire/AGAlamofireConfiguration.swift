//
//  AGAlamofireConfiguration.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



//MARK: - AGAlamofireConfiguration
public class AGAlamofireConfiguration {
  
  public static let shared = AGAlamofireConfiguration()
  private init() {
    
  }
  public var timeoutIntervalForRequest: TimeInterval = 30
  public var validator: AGAlamofireValidatable.Type? = AGOperationStatus.self
  
}


