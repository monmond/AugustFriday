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
  
  var sessionId: String
  var taskIds: [Int]
  
  init(sessionId: String, taskIds: [Int]) {
    self.sessionId = sessionId
    self.taskIds = taskIds
    
  }
  
}
