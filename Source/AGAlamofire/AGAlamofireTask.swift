//
//  AGAlamofireTask.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 7/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import Foundation



//MARK: - AGAlamofireTask
public class AGAlamofireTask {
  
  public var sessionId: String
  public var taskIds: [Int]
  
  public init(sessionId: String, taskIds: [Int]) {
    self.sessionId = sessionId
    self.taskIds = taskIds
    
  }
  
}
