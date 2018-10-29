//
//  Typealias+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - 1
public typealias LDVoid = (() -> ())
public typealias LDInt = ((Int) -> ())
public typealias CBVoid = (() -> ())
public typealias CBError = ((_ error: Error) -> ())
public typealias CBBool = ((_ isSelected: Bool) -> ())
public typealias CBString = ((_ text: String) -> ())



//MARK: - 2
public typealias StringInt = (text: Bool, index: Int)
public typealias BoolString = (isSelected: Bool, text: String)
public typealias BoolInt = (isSelected: Bool, index: Int)
public typealias BoolIndexPath = (isSelected: Bool, indexPath: IndexPath)
public typealias BoolDate = (isSelected: Bool, date: Date)

public typealias CBStringInt = ((_ response: StringInt) -> ())
public typealias CBBoolString = ((_ response: BoolString) -> ())
public typealias CBBoolInt = ((_ response: BoolInt) -> ())
public typealias CBBoolIndexPath = ((_ response: BoolIndexPath) -> ())
public typealias CBBoolDate = ((_ response: BoolDate) -> ())
