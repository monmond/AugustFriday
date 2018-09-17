//
//  AGDataResponseResult.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 12/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDataResponseResult
public enum AGDataResponseResult<T> {
  
  case success(T)
  case failure(AGError)
  
}
