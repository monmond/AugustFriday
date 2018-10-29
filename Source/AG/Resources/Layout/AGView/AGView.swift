//
//  AGView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 6/8/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGView
public class AGView: UIView, AGBouncingView {

  
  
}



//MARK: - Life Cycle
public extension AGView {
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goSquash()
    super.touchesBegan(touches, with: event)
    
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goBouncing()
    super.touchesEnded(touches, with: event)
    
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goIdentity()
    super.touchesCancelled(touches, with: event)
    
  }
  
}
