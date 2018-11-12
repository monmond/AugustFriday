//
//  AGPopupVCAttributedStringDependency.swift
//  atimemedia
//
//  Created by sasawat sankosik on 28/10/18.
//  Copyright © 2018 gmm. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog



//MARK: - AGPopupVCAttributedStringDependency
public protocol AGPopupVCAttributedStringDependency {
  func getMessageLeadingTextAttributed(with string: String) -> NSMutableAttributedString
  func getMessageCenterTextAttributed(with string: String) -> NSMutableAttributedString
}



//MARK: - Implements
public extension AGPopupVC {
  
}



//MARK: - Imports
public extension AGPopupVCAttributedStringDependency where Self: AGPopupVC  {
  
  public func getMessageLeadingTextAttributed(with string: String) -> NSMutableAttributedString {
    let string = NSMutableAttributedString(string: string)
    
    let style = NSMutableParagraphStyle()
    style.lineSpacing = 5
    style.alignment = .left
    style.lineBreakMode = .byTruncatingTail
    //    style.paragraphSpacingBefore = 0
    //    style.headIndent = 0
    //    style.firstLineHeadIndent = 0
    //    style.paragraphSpacingBefore = 0
    let attributes: [NSAttributedString.Key : Any] = [
      // Line spacing attribute
      .paragraphStyle: style,
      .foregroundColor: AG.C.Theme.cell_lb_1
    ]
    string.addAttributes(attributes, range: NSMakeRange(0, string.length))
    return string
  }
  
  public func getMessageCenterTextAttributed(with string: String) -> NSMutableAttributedString {
    let string = NSMutableAttributedString(string: string)
    let style = NSMutableParagraphStyle()
    style.lineSpacing = 10
    style.alignment = .center
    style.lineBreakMode = .byTruncatingTail
    let attributes: [NSAttributedString.Key : Any] = [
      // Line spacing attribute
      .paragraphStyle: style,
      .foregroundColor: AG.C.Theme.cell_lb_1
    ]
    string.addAttributes(attributes, range: NSMakeRange(0, string.length))
    return string
  }
  
}



