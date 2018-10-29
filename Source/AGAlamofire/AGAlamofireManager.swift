//
//  AGAlamofireManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Alamofire
import SwiftyJSON



//MARK: - AGAlamofireManager
public class AGAlamofireManager: NSObject {
  
  public static let shared = AGAlamofireManager()
  fileprivate var normal: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = AGAlamofireConfiguration.shared.timeoutIntervalForRequest
    let sessionManager = SessionManager(configuration: configuration)
    sessionManager.retrier = AGRetryHandler()
    return sessionManager
  }()
  fileprivate var tasks: [AGAlamofireTask] = []
  private override init() { }
  
}



//MARK: - Task
public extension AGAlamofireManager {
  
  fileprivate func insertTask(with sessionId: String = "", sessionTask: URLSessionTask?) {
    guard let st = sessionTask else { return }
    let task_id = st.taskIdentifier
    AGLog.info()
    AGLog.debug("\(sessionId) \(task_id)")
    if let t = tasks.first(where: { $0.sessionId == sessionId }) {
      t.taskIds.append(task_id)
    } else {
      let t = AGAlamofireTask(sessionId: sessionId, taskIds: [task_id])
      tasks.append(t)
    }
    logTask()
  }
  
  fileprivate func removeTask(with sessionId: String = "", sessionTask: URLSessionTask?) {
    guard let st = sessionTask else { return }
    let task_id = st.taskIdentifier
    AGLog.info()
    AGLog.debug("\(sessionId) \(task_id)")
    for t in tasks {
      if t.sessionId == sessionId {
        t.taskIds = t.taskIds.filter({ $0 != task_id })
      }
      if t.taskIds.isEmpty {
        tasks = tasks.filter({ $0.sessionId != t.sessionId })
      }
    }
    logTask()
  }
  
  fileprivate func logTask() {
    AGLog.info()
    for t in tasks {
      AGLog.debug("\(t.sessionId) \(t.taskIds)")
    }
  }
  
  public func cancelSession(with sessionId: SessionIdentifier = "") {
    AGLog.info()
    guard let task = tasks.first(where: { $0.sessionId == sessionId }) else { return }
    let taskIds = task.taskIds
    normal.session.getAllTasks() {
      for st in $0.reversed() {
        guard taskIds.contains(st.taskIdentifier) else { continue }
        st.cancel()
      }
    }
  }
  
}



//MARK: - RequestCodable
/*
 Waiting for alamofire 5
 */
public extension AGAlamofireManager {
  
  //  public func requestCodable<T: AGAlamofireCodableResponse>(_ endpoint: (URLRequestConvertible & AGRouter),
  //                                                       session: SessionIdentifier = "",
  //                                                       onComplete: @escaping ((AGDataResponse<T>) -> Void)) {
  //    if let r = AGNetworkManager.shared.reachability, r.currentReachabilityStatus == .notReachable {
  //      let message = r.currentReachabilityStatus
  //      onComplete(AGDataResponse<T>(data: nil, error: .reachability(message)))
  //    } else {
  //      self.codable(endpoint, session: session) {
  //        onComplete($0)
  //      }
  //    }
  //
  //  }
  //
  //  func codable<T: AGAlamofireCodableResponse>(_ endpoint: (URLRequestConvertible & AGRouter),
  //                                         session: SessionIdentifier = "",
  //                                         onComplete: @escaping ((AGDataResponse<T>) -> Void)) {
  //    let request = normal.request(endpoint)
  //    request.validate(statusCode: 200..<300)
  //    request.validate(contentType: ["application/json"])
  //    printStart()
  //    request.responseJSONDecodable { (response: DataResponse<T>) in
  //
  //      self.printRequest(request: response.request)
  //      self.printRequestHeader(request: response.request)
  //      self.printRequestParameter(urlRequest: endpoint.urlRequest)
  //
  //      var data: T?
  //      var error: AGError?
  //
  //      switch response.result {
  //      case let .success(d):
  //        self.printSuccess()
  //        data = d
  //        self.printResponseData(data: data)
  //
  //        guard let os = d._operation_status else {
  //          error = .operationstatus
  //          break
  //        }
  //
  //        guard os.status else {
  //          error = .notsuccess
  //          break
  //        }
  //
  //      case let .failure(e):
  //        self.printFailure()
  //        self.printResponseError(error: response.error)
  //
  //        guard !e.cancelled else {
  //          error = .cancelled
  //          break
  //        }
  //
  //        guard !e.isTimedOut else {
  //          error = .timedOut(e)
  //          break
  //        }
  //
  //        error = .alamofire(e)
  //
  //      }
  //
  //      onComplete(AGDataResponse<T>(data: data, error: error))
  //
  //    }
  //
  //  }
  
}



//MARK: - RequestJSON
public extension AGAlamofireManager {
  
  public func requestJSON(_ endpoint: (URLRequestConvertible & AGAlamofireRouter),
                          session: SessionIdentifier = "",
                          validator: AGAlamofireValidatable.Type? = nil,
                          onComplete: @escaping CBAGDataResponseJSON) {
    if let r = AGNetworkManager.shared.reachability, r.currentReachabilityStatus == .notReachable {
      let message = r.currentReachabilityStatus
      onComplete(AGDataResponse<JSON>(data: nil, error: .reachability(message)))
    } else {
      self.json(endpoint, session: session, validator: validator) {
        onComplete($0)
      }
    }
    
  }
  
  fileprivate func json(_ endpoint: (URLRequestConvertible & AGAlamofireRouter),
                        session: SessionIdentifier = "",
                        validator: AGAlamofireValidatable.Type? = nil,
                        onComplete: @escaping CBAGDataResponseJSON) {
    let request = normal.request(endpoint)
    request.validate(statusCode: 200..<300)
    request.validate(contentType: ["application/json"])
    insertTask(with: session, sessionTask: request.task)
    printStart()
    request.downloadProgress(queue: DispatchQueue.global(qos: .utility)) {
      AGLog.info("fractionCompleted: \($0.fractionCompleted)")
    }
    request.responseJSON {
      self.removeTask(with: session, sessionTask: request.task)
      self.printRequest(request: $0.request)
      self.printRequestHeader(request: $0.request)
      self.printRequestParameter(urlRequest: endpoint.urlRequest)
      
      var data: JSON?
      var error: AGError?
      
      switch $0.result {
      case let .success(v):
        
        self.printSuccess()
        let json = JSON(v)
        data = json
        self.printResponseData(data: data)
        
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
          error = .operationstatus
          break
        }
        
        guard os.status else {
          error = .notsuccess
          break
        }
        
      case let .failure(e):
        self.printFailure()
        self.printResponseError(error: $0.error)
        
        guard !e.cancelled else {
          error = .cancelled
          break
        }
        
        guard !e.isTimedOut else {
          error = .timedOut(e)
          break
        }
        
        error = .alamofire(e)
        
      }
      
      onComplete(AGDataResponse<JSON>(data: data, error: error))
      
    }
  }
  
}


//MARK: - Log
fileprivate extension AGAlamofireManager {
  
  fileprivate func printStart() {
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    AGLog.debug(">>>>>>>>>> START REQUEST >>>>>>>>>>>")
    AGLog.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
  }
  
  fileprivate func printSuccess() {
    AGLog.debug("========= SUCCESS RESPONSE =========")
  }
  
  fileprivate func printFailure() {
    AGLog.debug("========= FAILED RESPONSE ==========")
  }
  
  fileprivate func printRequest(request: URLRequest?) {
    guard let req = request else {
      return
    }
    AGLog.debug("============ URLREQUEST ============")
    AGLog.debug(req)
  }
  
  fileprivate func printRequestHeader(request: URLRequest?) {
    guard let req = request?.allHTTPHeaderFields else {
      return
    }
    let parameter = JSON(req)
    AGLog.debug("========== REQUEST HEADER =========")
    AGLog.debug(parameter)
  }
  
  fileprivate func printRequestParameter(urlRequest: URLRequest?) {
    guard let httpBody = urlRequest?.httpBody else {
      return
    }
    let parameters = JSON(httpBody)
    AGLog.debug("======== REQUEST PARAMETERS =======")
    AGLog.debug(parameters)
  }
  
  fileprivate func printHTTPURLResponse(data: HTTPURLResponse?) {
    guard let tmp = data else {
      return
    }
    AGLog.debug("======= RESPONSE STATUS CODE ======")
    AGLog.debug(tmp.statusCode)
  }
  
  fileprivate func printResponseData(data: Any?) {
    guard let tmp = data else {
      return
    }
    AGLog.debug("=========== RESPONSE DATA ==========")
    AGLog.debug(tmp)
  }
  
  fileprivate func printHTTPmapper(status: AGOperationStatus) {
    AGLog.debug("============ HTTP MAPPER ===========")
    AGLog.debug(status.code)
    AGLog.debug(status.description)
  }
  
  fileprivate func printResponseError(error: Error?) {
    guard let err = error else {
      return
    }
    AGLog.debug("=============== ERROR ===============")
    AGLog.debug(err)
  }
  
}




