//
//  AGDate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import Foundation



public enum AGDateStyle: String, AGEnum {
  
  case iso = "yyyy-MM-dd'T'HH:mm:ssZ"
  case iso2 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
  case display = "dd MMMM yyyy"
  case orderRef = "yyyyMMddHHmmssSSS"
  case JTAppleCalendar = "yyyy MM dd"
  case lastUpdate = "h:mm:ss a"
  case month = "MM"
  case year = "yyyy"
  case time = "HH:mm"
  
}



public class AGDate {
  
  private init() { }
  
  public class var format_style: [String] {
    let style: [AGDateStyle] = AGDateStyle.allValues
    return style.map({ $0.rawValue })
  }
  
  public class var format_default: [String] {
    let style = [
      "yyyy-MM-dd'T'HH:mm:ss'Z'",
      "yyyy-MM-dd'T'HH:mm:ssZ",
      "yyyy-MM-dd'T'HH:mm:ss",
      "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
      "yyyy-MM-dd HH:mm:ss",
      "yyyy:MM:dd HH:mm:ss",
      "yyyy MM dd'T'HH:mm:ss'Z'",
      "yyyy MM dd'T'HH:mm:ssZ",
      "yyyy MM dd'T'HH:mm:ss",
      "yyyy MM dd'T'HH:mm:ss.SSS'Z'",
      "yyyy MM dd'T'HH:mm:ss.SSSZ",
      "yyyy MM dd HH:mm:ss",
      "MM/dd/yyyy HH:mm:ss",
      "MM/dd/yyyy'T'HH:mm:ss.SSS'Z'",
      "MM/dd/yyyy'T'HH:mm:ss.SSSZ",
      "MM/dd/yyyy'T'HH:mm:ss.SSS",
      "MM/dd/yyyy'T'HH:mm:ssZ",
      "MM/dd/yyyy'T'HH:mm:ss",
      "dd-MM-yyyy'T'HH:mm:ss'Z'",
      "dd-MM-yyyy'T'HH:mm:ssZ",
      "dd-MM-yyyy'T'HH:mm:ss",
      "dd-MM-yyyy'T'HH:mm:ss.SSS'Z'",
      "dd-MM-yyyy'T'HH:mm:ss.SSSZ",
      "dd-MM-yyyy HH:mm:ss",
      "dd/MM/yyyy HH:mm:ss",
      "dd/MM/yyyy'T'HH:mm:ss.SSS'Z'",
      "dd/MM/yyyy'T'HH:mm:ss.SSSZ",
      "dd/MM/yyyy'T'HH:mm:ss.SSS",
      "dd/MM/yyyy'T'HH:mm:ssZ",
      "dd/MM/yyyy'T'HH:mm:ss",
      "dd:MM:yyyy HH:mm:ss",
      "dd MM yyyy'T'HH:mm:ss'Z'",
      "dd MM yyyy'T'HH:mm:ssZ",
      "dd MM yyyy'T'HH:mm:ss",
      "dd MM yyyy'T'HH:mm:ss.SSS'Z'",
      "dd MM yyyy'T'HH:mm:ss.SSSZ",
      "dd MM yyyy HH:mm:ss" ,
      "yyyyMMdd",
      "ddMMyyyy",
      "yyyyMMddHHmmssSSS",
      "EEE, MMMM dd, yyyy",
      "MMMM, yyyy"
    ]
    return style
  }
  
  public class var format_all: [String] {
    return format_default + format_style
  }
  
  public class var calander: Calendar {
    let calendar = Calendar(identifier: .gregorian)
    //    calendar.timeZone = TimeZone(identifier: "Asia/Bangkok")!
    return calendar
  }
  
  public class var formatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.calendar = Calendar(identifier: .gregorian)
    //    formatter.timeZone = TimeZone(identifier: "Asia/Bangkok")
    //    formatter.locale = Locale(identifier: "th_TH")
    formatter.calendar = calander
    return formatter
  }
  
}



//MARK: - CORE FUNCTION
extension AGDate {
  
  public class func stringToDate(date: String) -> Date? {
    let formatter = self.formatter
    for i in format_all {
      formatter.dateFormat = i
      if let date_formatted = formatter.date(from: date) {
        return date_formatted
      }
    }
    return nil
  }
  
  public class func dateToString(date: Date, style: AGDateStyle) -> String {
    let formatter = self.formatter
    formatter.dateFormat = style.rawValue
    let timeStamp = formatter.string(from: date)
    return timeStamp
  }
  
  public class func dateToString(date: Date, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
    let timeStamp = DateFormatter.localizedString(from: date, dateStyle: dateStyle, timeStyle: timeStyle)
    return timeStamp
  }
  
  public class func convertDateFormat(date: String, style: AGDateStyle) -> String? {
    if let stringToDate = stringToDate(date: date) {
      return dateToString(date: stringToDate, style: style)
    }
    return nil
  }
  
  public class func convertDateFormatCustom(date: String, style: String) -> String? {
    if let stringToDate = stringToDate(date: date) {
      let formatter = self.formatter
      formatter.dateFormat = style
      let timeStamp = formatter.string(from: stringToDate)
      return timeStamp
    }
    return nil
  }
  
  /// Returns all the date components of a date, formatted by SHCalendar
  public class func dateByFormatter(date: Date) -> Date? {
    let components = calander.dateComponents([.day, .month, .year ,.hour, .minute, .second, .nanosecond, .timeZone], from: date)
    guard let formatted = calander.date(from: components) else {
      return nil
    }
    return formatted
  }
  
  /// Return Date with Time Shifter
  public class func dateByComponent(date: Date, component: DateComponents) -> Date? {
    guard let date = calander.date(byAdding: component, to: date) else {
      return nil
    }
    return date
  }
  
  public class func setDate(day: Int) -> Date? {
    var components = calander.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date())
    components.day = day
    guard let date = calander.date(from: components) else {
      return nil
    }
    return date
  }
  
}



//MARK: - OTHER FUNCTION
public extension AGDate {
  
  public class func startOfDay(date: Date) -> String? {
    let dateComponents = DateComponents(hour: 0, minute: 0, second: 0, nanosecond: 0)
    guard let date = dateByComponent(date: date, component: dateComponents) else {
      return nil
    }
    return dateToString(date: date, style: .iso2)
  }
  
  public class func endOfDay(date: Date) -> String? {
    let dateComponents = DateComponents(hour: 23, minute: 59, second: 59, nanosecond: 999)
    guard let date = dateByComponent(date: date, component: dateComponents) else {
      return nil
    }
    return dateToString(date: date, style: .iso2)
  }
  
}

