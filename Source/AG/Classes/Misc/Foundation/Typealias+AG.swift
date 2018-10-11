//
//  Typealias+AG.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - 1
public typealias LambdaVoid = (() -> Swift.Void)
public typealias LambdaInt = ((Int) -> Swift.Void)
public typealias CallbackVoid = (() -> Swift.Void)
public typealias CallbackError = ((_ error: Error) -> Swift.Void)
public typealias CallbackBool = ((_ isSelected: Bool) -> Swift.Void)
public typealias CallbackString = ((_ text: String) -> Swift.Void)



//MARK: - 2
public typealias StringInt = (text: Bool, index: Int)
public typealias BoolString = (isSelected: Bool, text: String)
public typealias BoolInt = (isSelected: Bool, index: Int)
public typealias BoolDate = (isSelected: Bool, date: Date)

public typealias CallbackStringInt = ((_ response: StringInt) -> Swift.Void)
public typealias CallbackBoolString = ((_ response: BoolString) -> Swift.Void)
public typealias CallbackBoolInt = ((_ response: BoolInt) -> Swift.Void)
public typealias CallbackBoolDate = ((_ response: BoolDate) -> Swift.Void)
