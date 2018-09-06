//
//  AGFormatter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import Foundation

public class AGFormatter {
  
  public class func steamUrlFormatToSteamDisplay(steamUrlFormat: String, point: String, replace: String) -> String {
    return steamUrlFormat.replacingOccurrences(of: "{\(point)}", with: replace)
  }
  
}

public extension AGFormatter {
  
  public class CitizenId {
    
    public class func numberToCitizenIdFormat(string: String) -> String {
      var temp = string
      if temp.count < 13 {
        let missingRange = 13 - temp.count
        temp += String(repeating: "0", count: missingRange)
      }
      let split = [temp[0], temp[1...4], temp[5...9], temp[10...11], temp[12]]
      return split.joined(separator: "-")
    }
    
    public class func citizenIdFormatToNumber(string: String) -> String {
      return string.replacingOccurrences(of: "-", with: "")
    }
    
  }
  
}

public extension AGFormatter {
  
  public class Phone {
    
    public class func generateMsisdn(string: String) -> String? {
      if (string[0] == "0") {
        return "66\(string[1...string.count-1])"
      } else if(string[0...1] == "66") {
        return string
      }
      return nil
    }
    
    public class func msisdnToPhone(string: String) -> String {
      var phone = string
      if (string[0...1] == "66") {
        phone = "0\(string[2...string.count-1])"
      } else if (string[0] == "0") {
        phone = string
      }
      return phone
    }
    
    public class func phoneToMsisdn(string: String) -> String {
      var msisdn = string
      if(string[0] == "0"){
        msisdn = "66\(string[1...string.count-1])"
      }else if(string[0...1] == "66"){
        msisdn = string
      }
      return msisdn
    }
    
    public class func phoneDisplayFormatToNumber(string: String) -> String {
      return string.replacingOccurrences(of: " ", with: "")
    }
    
    public class func numberToPhoneDisplay(string: String, displayQuickCall: Bool = false) -> String {
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
  
}


