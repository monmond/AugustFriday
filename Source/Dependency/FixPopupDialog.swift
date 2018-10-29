//
//  PopupDialogConfig.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 24/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



/*
# Popup dialog
pod 'PopupDialog', '~> 0.8.1'
*/



/*
 fix = statusbar color
 file = PopupDialog.swift
 class = PopupDialog
 ## start add
 public override var preferredStatusBarStyle: UIStatusBarStyle {
   return .lightContent
 }
 ## end add
 */



/*
 fix = alignment
 file = PopupDialogContainerView.swift
 class = PopupDialogContainerView, PopupDialog
 
 ## start editFrom
 # 1 PopupDialog
 # 1.1
 
 # 1.2
 convenience init
 
 # 1.3
 public init(
 
 # 1.4
 public override func loadView() {
 view = PopupDialogContainerView(frame: UIScreen.main.bounds,
 preferredWidth: preferredWidth)
 }
 
 
 # 2 class = PopupDialogContainerView
 # 2.1
 internal init(frame: CGRect, preferredWidth: CGFloat)
 
 # 2.2
 centerYConstraint = NSLayoutConstraint(item: shadowContainer,
 attribute: .centerY,
 relatedBy: .equal,
 toItem: self,
 attribute: .centerY,
 multiplier: 1,
 constant: 0)
 
 if let centerYConstraint = centerYConstraint {
 constraints.append(centerYConstraint)
 }
 ## end editFrom
 
 ## start editTo
 # 1 PopupDialog
 # 1.1
 public var isAlignCenter: Bool = true
 
 # 1.2
 convenience init(..., isAlignCenter: Bool = true, completion: (() -> Void)? = nil)
 
 # 1.3
 public init(..., isAlignCenter: Bool = true, completion: (() -> Void)? = nil)
 self.isAlignCenter = isAlignCenter
 
 # 1.4
 public override func loadView() {
 view = PopupDialogContainerView(frame: UIScreen.main.bounds,
 preferredWidth: preferredWidth,
 isAlignCenter: isAlignCenter)
 }
 
 
 # 2 class = PopupDialogContainerView
 # 2.1
 internal init(frame: CGRect, preferredWidth: CGFloat, isAlignCenter: Bool)
 
 # 2.2 class = PopupDialogContainerView
 if isAlignCenter {
 centerYConstraint = NSLayoutConstraint(item: shadowContainer,
 attribute: .centerY,
 relatedBy: .equal,
 toItem: self,
 attribute: .centerY,
 multiplier: 1,
 constant: 0)
 
 if let centerYConstraint = centerYConstraint {
 constraints.append(centerYConstraint)
 }
 } else {
 if #available(iOS 11.0, *) {
 constraints += [
 NSLayoutConstraint(item: shadowContainer,
 attribute: .bottom,
 relatedBy: .equal,
 toItem: safeAreaLayoutGuide,
 attribute: .bottom,
 multiplier: 1,
 constant: -20)
 ]
 } else {
 let space_standard: CGFloat = 8.0
 constraints += [
 NSLayoutConstraint(item: shadowContainer,
 attribute: .bottom,
 relatedBy: .equal,
 toItem: self,
 attribute: .bottom,
 multiplier: 1,
 constant: -20 - space_standard)
 ]
 }
 }
 ## end editTo
 */
