//
//  AGRetryHandler.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Alamofire



//MARK: - RetryHandler
public class AGRetryHandler: RequestRetrier {
  
  public func should(_ manager: Session, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
    if let _ = request.task?.response as? HTTPURLResponse, request.retryCount <= 5 {
      completion(true, 1)
    } else {
      completion(false, 0.0)
    }
  }
  
}
