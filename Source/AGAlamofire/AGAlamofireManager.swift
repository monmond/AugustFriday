//
//  AGAlamofireManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON



public class AGAlamofireUtil {
  
  //MARK: - VIP
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Public
  public static func requestJSON(with session: Session,
                                 endpoint: (URLRequestConvertible & AGAlamofireRouter),
                                 validator: AGAlamofireValidatable.Type? = nil,
                                 onComplete: @escaping CBAGDataResponseJSON) {
    if let r = AGNetworkManager.shared.reachability, r.currentReachabilityStatus == .notReachable {
      let message = r.currentReachabilityStatus
      onComplete(AGDataResponse<JSON>(data: nil, error: .service((.get, 0, message.getDescription))))
    } else {
      AGAlamofireUtil.json(with: session, endpoint: endpoint, validator: validator) {
        onComplete($0)
      }
    }
  }
  
  fileprivate static func json(with session: Session,
                               endpoint: (URLRequestConvertible & AGAlamofireRouter),
                               validator: AGAlamofireValidatable.Type? = nil,
                               onComplete: @escaping CBAGDataResponseJSON) {
    let request = session.request(endpoint)
    request.validate(statusCode: 200..<300)
    request.validate(contentType: ["application/json"])
    request.downloadProgress(queue: DispatchQueue.global(qos: .utility)) {
      AGLog.info("fractionCompleted: \($0.fractionCompleted)")
    }
    request.responseJSON {
      var data: JSON?
      var error: AGError?
      
      switch $0.result {
      case let .success(v):
        let json = JSON(v)
        data = json
        var validatable: AGAlamofireValidatable.Type?
        if let v = validator {
          validatable = v
        } else if let v = AGAlamofireConfiguration.shared.validator {
          validatable = v
        }
        guard let v = validatable else {
          break
        }
        guard let os = v.init(json: json) else {
          error = .service((.operationstatus, 0, ""))
          break
        }
        guard os.status else {
          error = .service((.notsuccess, 0, ""))
          break
        }
      case let .failure(e):
        guard !e.cancelled else {
          error = .service((.cancelled, 0, ""))
          break
        }
        guard !e.isTimedOut else {
          error = .service((.timedOut, 0, ""))
          break
        }
        error = .service((.none, 0, ""))
      }
      onComplete(AGDataResponse<JSON>(data: data, error: error))
    }
  }
  
  
  //MARK: - VIP - UseCase
  
  
  
  //MARK: - Core - Protocol
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: - Pods - Protocol
  
  
  
}
