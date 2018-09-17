//
//  SongRouter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation
import Alamofire
import SwiftyJSON



public typealias CallbackAvatarApiGetAvatar = ((AGAlamofireResponse<GetAvatar.Response>) -> ())



public class AvatarApi {
  
//  class let agam =
  
  public class func getAvatar(_ param: GetAvatar.Request,
                              onComplete: @escaping CallbackAvatarApiGetAvatar) {
    let endpoint = AvatarRouter.getAvatar(param)
    AGAlamofireManager.shared.requestJSON(endpoint) {
      let data = GetAvatar.Response(json: $0.data)
      onComplete(AGAlamofireResponse<GetAvatar.Response>(data: data, error: $0.error))
    }
    
  }
  
}



public enum AvatarRouter: AGAlamofireRouter, URLRequestConvertible {
  
  case getAvatar(GetAvatar.Request)
  
  public var encoding: ParameterEncoding {
    switch method {
    case .get, .delete:
      return URLEncoding.default
    case .post, .put:
      return JSONEncoding.default
    default:
      return URLEncoding.default
    }
  }
  
  public var baseURL: String {
    return "https://api.omumusic.net"
  }
  
  public var apiGroup: String {
    return "/avatar"
  }
  
  public var path: String {
    switch self {
    case .getAvatar:
      return "/get_avatar"
    }
  }
  
  public var method: HTTPMethod {
    switch self {
    case .getAvatar:
      return .get
    }
  }
  
  public func asURLRequest() throws -> URLRequest {
    let urlRequest = theURLRequest
    switch self {
    case .getAvatar(_):
      break
    }
    return urlRequest
    
  }
  
}



public struct GetAvatar {
  
  public struct Request {
    public var param: Parameters {
      let param = Parameters()
      return param
    }
  }
  
  public struct Response: AGAlamofireCodableResponse {
    
    public enum CodingKeys: String, CodingKey {
      case _operation_status = "operation_status"
      case _data = "data"
    }
    
    public init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      _data = try values.decode([Avatar].self, forKey: ._data)
      _operation_status = try AGOperationStatus(from: decoder)

    }
    
    public var _operation_status: AGOperationStatus?
    public var _data: [Avatar] = []
    
    public var operation_status: AGOperationStatus {
      return _operation_status ?? AGOperationStatus()
    }
    public var data: [Avatar] {
      return _data
    }
    
    public enum Key {
      public static var operation_status = "operation_status"
      public static var data = "data"
    }
    
    public init?(json: JSON?) {
      guard let json = json else {
        return
      }
      guard json[Key.data].exists() else {
        return
      }
      
      _operation_status = AGOperationStatus(json: json)
      _data = json[Key.data].arrayValue.compactMap({ Avatar(json: $0) })
    }
  }
  
}



//MARK: - Avatar
public class Avatar: AGModelHelper, Codable {
  
  public enum CodingKeys: String, CodingKey {
    case _id = "id"
    case _url = "url"
    case _start_time = "start_time"
    case _end_time = "end_time"
    case _status = "status"
    case _create_date = "create_date"
  }
  
  public var _id : Int?
  public var _url : String?
  public var _start_time : String?
  public var _end_time : String?
  public var _status : String?
  public var _create_date : String?
  
  public init(id: Int,
       url: String,
       start_time: String,
       end_time: String,
       status: String,
       create_date: String) {
    self._id = id
    self._url = url
    self._start_time = start_time
    self._end_time = end_time
    self._status = status
    self._create_date = create_date
  }
  
  public init?(json: JSON?) {
    guard let json = json else { return }
    self._id = json[Key.id].int
    self._url = json[Key.url].string
    self._start_time = json[Key.start_time].string
    self._end_time = json[Key.end_time].string
    self._status = json[Key.status].string
    self._create_date = json[Key.create_date].string
  }
  
}


//MARK: - Key
public extension Avatar {
  
  public enum Key {
    static var id = "id"
    static var url = "url"
    static var start_time = "start_time"
    static var end_time = "end_time"
    static var status = "status"
    static var create_date = "create_date"
  }
  
}



//MARK: - Getter
public extension Avatar {
  
  public var id: Int {
    return _id ?? 0
  }
  
  public var url: String {
    return _url ?? ""
  }
  
  public var start_time: String {
    return _start_time ?? ""
  }
  
  public var end_time: String {
    return _end_time ?? ""
  }
  
  public var status: String {
    return _status ?? ""
  }
  
  public var create_date: String {
    return _create_date ?? ""
  }
  
}



//MARK: - Parser
public extension Avatar {
  
  public var getJson: JSON {
    let json: JSON = [
      Key.id : id,
      Key.url : url,
      Key.start_time : start_time,
      Key.end_time : end_time,
      Key.status : status,
      Key.create_date : create_date
    ]
    return json
  }
  
}
