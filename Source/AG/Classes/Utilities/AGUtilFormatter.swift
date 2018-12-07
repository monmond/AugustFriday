//
//  AG.UtilFormatter.swift
//  AugustFriday
//
//  Created by Sasawat Sankosik on 6/12/2561 BE.
//  Copyright © 2561 ssankosik. All rights reserved.
//



import Foundation



public extension AG.Util.Formatter {
  
  public class Phone: AGFormatterPhone { }
  public class Citizen: AGFormatterCitizen { }
  
}



public protocol AGFormatter {
  static func steamUrlFormatToSteamDisplay(steamUrlFormat: String, point: String, replace: String) -> String
}



extension AGFormatter {
  
  public static func steamUrlFormatToSteamDisplay(steamUrlFormat: String, point: String, replace: String) -> String {
    return steamUrlFormat.replacingOccurrences(of: "{\(point)}", with: replace)
  }
  
}



public protocol AGFormatterPhone {
  static func generateMsisdn(string: String) -> String?
  static func msisdnToPhone(string: String) -> String
  static func phoneToMsisdn(string: String) -> String
  static func phoneDisplayFormatToNumber(string: String) -> String
  static func numberToPhoneDisplay(string: String, displayQuickCall: Bool) -> String
}



extension AGFormatterPhone {
  
  public static func generateMsisdn(string: String) -> String? {
    if (string[0] == "0") {
      return "66\(string[1...string.count-1])"
    } else if(string[0...1] == "66") {
      return string
    }
    return nil
  }
  
  public static func msisdnToPhone(string: String) -> String {
    var phone = string
    if (string[0...1] == "66") {
      phone = "0\(string[2...string.count-1])"
    } else if (string[0] == "0") {
      phone = string
    }
    return phone
  }
  
  public static func phoneToMsisdn(string: String) -> String {
    var msisdn = string
    if(string[0] == "0"){
      msisdn = "66\(string[1...string.count-1])"
    }else if(string[0...1] == "66"){
      msisdn = string
    }
    return msisdn
  }
  
  public static func phoneDisplayFormatToNumber(string: String) -> String {
    return string.replacingOccurrences(of: " ", with: "")
  }
  
  public static func numberToPhoneDisplay(string: String, displayQuickCall: Bool = false) -> String {
    let temp = string
    if temp.count < 10 {
      return temp
    }
    let split = [temp[0...2], temp[3...5], temp[6...9]]
    if !displayQuickCall {
      return split.joined(separator: " ")
    } else {
      return split.joined(separator: "-")
    }
  }
  
}



public protocol AGFormatterCitizen {
  static func numberToCitizenIdFormat(string: String) -> String
  static func citizenIdFormatToNumber(string: String) -> String
}



extension AGFormatterCitizen {
  
  public static func numberToCitizenIdFormat(string: String) -> String {
    var temp = string
    if temp.count < 13 {
      let missingRange = 13 - temp.count
      temp += String(repeating: "0", count: missingRange)
    }
    let split = [temp[0], temp[1...4], temp[5...9], temp[10...11], temp[12]]
    return split.joined(separator: "-")
  }
  
  public static func citizenIdFormatToNumber(string: String) -> String {
    return string.replacingOccurrences(of: "-", with: "")
  }
  
}

