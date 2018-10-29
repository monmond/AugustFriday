//
//  Collection.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 29/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - Arrange
public extension MutableCollection {
  
  public mutating func agShuffle() {
    for i in indices.dropLast() {
      let diff = distance(from: i, to: endIndex)
      let j = index(i, offsetBy: numericCast(arc4random_uniform(numericCast(diff))))
      swapAt(i, j)
    }
  }
  
}
