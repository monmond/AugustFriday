//
//  AFManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Alamofire
import SwiftyJSON



//MARK: - AFWrapper
public class AGAlamofireHelper: NSObject {
  
  public static let shared = AGAlamofireHelper()
  private var normal: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = 30
    let sessionManager = SessionManager(configuration: configuration)
    sessionManager.retrier = AGRetryHandler()
    return sessionManager
  }()
  //  private var request: [AGDataRequest] = []
  
  private override init() { }
  
  public func request(_ endpoint: (URLRequestConvertible & AGRouter),
                      taskIdentifier: LambdaInt? = nil,
                      onComplete: @escaping CallbackAGResponseJSON) {
    AGLog.debug(#function, scope: AGAlamofireHelper.self)
    if let r = AGNetworkManager.shared.reachability, r.currentReachabilityStatus == .notReachable {
      let message = r.currentReachabilityStatus
      onComplete(AGResponse<JSON>(data: nil, error: .reachability(message)))
    } else {
      self.requestJSON(endpoint, taskIdentifier: taskIdentifier) {
        onComplete($0)
      }
    }
    
  }
  
  private func requestJSON(_ endpoint: (URLRequestConvertible & AGRouter),
                           taskIdentifier: LambdaInt? = nil,
                           onComplete: @escaping CallbackAGResponseJSON) {
    AGLog.debug(#function, scope: AGAlamofireHelper.self)
    let request = normal.request(endpoint)
    if let t = request.task {
      taskIdentifier?(t.taskIdentifier)
    }
    request.validate(statusCode: 200..<300)
    request.validate(contentType: ["application/json"])
    request.responseJSON {
      
      self.printSuccess()
      self.printRequest(request: $0.request)
      self.printRequestHeader(request: $0.request)
      self.printRequestParameter(urlRequest: endpoint.urlRequest)
      
      var data: JSON?
      var error: AGError?
      
      switch $0.result {
      case let .success(v):
        
        let json = JSON(v)
        data = json
        self.printResponseData(data: data)
        
        guard let os = AGOperationStatus(json: json) else {
          error = .operationstatus
          break
        }
        
        guard os.status else {
          error = .notsuccess
          break
        }
        
      case let .failure(e):
        
        self.printFailure()
        self.printRequest(request: $0.request)
        self.printResponseError(error: $0.error)
        
        
        guard !e.isTimedOut else {
          error = .timedOut(e)
          break
        }
        
        error = .alamofire(e)
        
      }
      
      onComplete(AGResponse<JSON>(data: data, error: error))
      
    }
  }
  
}



//MARK: - Log
extension AGAlamofireHelper {
  
  func printSuccess() {
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    AGLog.debug(">>>>>>>>> SUCCESS RESPONSE >>>>>>>>>")
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }
  
  func printFailure() {
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    AGLog.debug(">>>>>>>>> FAILED RESPONSE >>>>>>>>>>")
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }
  
  func printRequest(request: URLRequest?) {
    guard let req = request else {
      return
    }
    AGLog.debug("============= REQUEST =============")
    AGLog.debug(req)
  }
  
  func printRequestHeader(request: URLRequest?) {
    guard let req = request?.allHTTPHeaderFields else {
      return
    }
    let parameter = JSON(req)
    AGLog.debug("========== REQUEST HEADER =========")
    AGLog.debug(parameter)
  }
  
  func printRequestParameter(urlRequest: URLRequest?) {
    guard let httpBody = urlRequest?.httpBody else {
      return
    }
    let parameters = JSON(httpBody)
    AGLog.debug("======== REQUEST PARAMETERS =======")
    AGLog.debug(parameters)
  }
  
  func printHTTPURLResponse(data: HTTPURLResponse?) {
    guard let tmp = data else {
      return
    }
    AGLog.debug("======= RESPONSE STATUS CODE ======")
    AGLog.debug(tmp.statusCode)
  }
  
  func printResponseData(data: JSON?) {
    guard let tmp = data else {
      return
    }
    AGLog.debug("=========== RESPONSE DATA ==========")
    AGLog.debug(tmp)
  }
  
  func printHTTPmapper(status: AGOperationStatus) {
    AGLog.debug("============ HTTP MAPPER ===========")
    AGLog.debug(status.code)
    AGLog.debug(status.description)
  }
  
  func printResponseError(error: Error?) {
    guard let err = error else {
      return
    }
    AGLog.debug("=============== ERROR ===============")
    AGLog.debug(err)
  }
  
}




