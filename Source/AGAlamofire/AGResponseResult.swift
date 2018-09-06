//
//  AFResponseResult.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGResponseResult
public enum AGResponseResult<T> {
  
  case success(T)
  case failure(AGError)
  
}
