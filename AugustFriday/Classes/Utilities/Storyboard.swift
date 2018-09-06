//
//  StoryBoard.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



enum Storyboard {
  
  class Main {
    
    static func mainVC() {
      AGLog.info(#function, scope: self)
      
    }
    
  }
  
  struct Login {
    
    static func loginVC() {
      AGLog.info(#function, scope: self)
      
    }
    
  }
  
}
