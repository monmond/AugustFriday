//
//  AGDate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGDate
public class AGDate {
  
  private init() { }
  
  public class var format_style: [String] {
    let style: [AGDateStyle] = AGDateStyle.allCases
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
 
}

