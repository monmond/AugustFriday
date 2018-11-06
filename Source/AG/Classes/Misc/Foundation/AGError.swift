//
//  AGError.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation
import Alamofire



//MARK: - AGError
public enum AGError: Error {
  
  //MARK: - AFWrapper & AFResponse
  case alamofire(Error)
  case firebase(Error)
  case facebook(Error)
  case google(Error)
  case reachability(AGReachabilityStatus)
  case cancelled
  case timedOut(Error)
  case responseDataNotValid
  case responseDataInit
  case operationstatus
  case notsuccess
  
  
  //MARK: - Authentication
  case notLoggedIn
  
  
  //MARK: - Data
  case dataFormat
  case dataEmpty
  case dataNotValid
  case cannotGetData
  case cannotUpdateData(String)
  case cannotDeleteData
  case cannotCreateData
  case indexOutOfBound
  
  //MARK: - UI
  case noMoreData
  
  
  
  //MARK: - User
  case inputNotValid
  case inputFormat
  
  
  //MARK: - Facebook
  case shareFacebookFail(Error)
  
  
  //MARK: - UIActivity
  case shareOtherFail(Error)
  
  
  //MARK: - UNIDENTIFY
  case layoutNotFound
  case facebookProfile
  case facebookLogin
  case googleLogin
  
}


public extension AGError {
  
  public var getAFError: AFError? {
    if case let .alamofire(error) = self, let e = error as? AFError {
      return e
    }
    return nil
  }
  
}




