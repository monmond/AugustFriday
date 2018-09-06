//
//  AGDateStyle.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: Imports
import Foundation



//MARK: AGDateStyle
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
