//
//  String+AGPresenter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 26/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - Converter
public extension String {
  
  public var toInt: Int {
    return (self as NSString).integerValue
  }
  
  public var toBool: Bool {
    return NSString(string: self).boolValue
  }
  
  public static func className(_ aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
  }
  
}



//MARK: - Range
public extension String {
  
  public subscript (i: Int) -> Character {
    return self[self.index(self.startIndex, offsetBy: i)]
  }
  
  public subscript (i: Int) -> String {
    return String(self[i] as Character)
  }
  
  public subscript (r: Range<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return String(self[start..<end])
  }
  
  public subscript (r: ClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return String(self[start...end])
  }
  
}
