//
//  AGIndictable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 17/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGIndictable
public protocol AGIndictable {
  func startIndicator(completion: @escaping CBVoid)
  func updateIndicator(with progress: Float)
  func endIndicator(completion: @escaping CBVoid)
}
