//
//  AGKeyboardManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - AGKeyboardHelper
public class AGKeyboardHelper: NSObject {
  //MARK: - UI
  fileprivate var vc: UIViewController!
  fileprivate var txt_active: UITextField?
  fileprivate lazy var tap_dismissKeyboard: UITapGestureRecognizer = {
    let tap = UITapGestureRecognizer(target: self,
                                     action: #selector(dismissKeyboardGestureTapped))
    tap.cancelsTouchesInView = false
    tap.delegate = self
    return tap
  }()
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  public var flag_scrollToBottom: Bool = false
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  public init(vc: UIViewController) {
    super.init()
    self.vc = vc
    onInit()
  }
  
  deinit {
    onDeinit()
    
  }
}



//MARK: - Life Cycle
extension AGKeyboardHelper {
  
  func onInit() {
    setupGestures()
    setupKeyboardObserverListeners()
    
  }
  
  func onDeinit() {
    vc = nil
    txt_active = nil
    vc.view.removeGestureRecognizer(tap_dismissKeyboard)
    removeKeyboardObserverListeners()
    
  }
  
  
}



//MARK: - Setup
extension AGKeyboardHelper {
  
  fileprivate func setupKeyboardObserverListeners() {
    let nc = NotificationCenter.default
    nc.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    nc.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    
  }
  
  fileprivate func removeKeyboardObserverListeners() {
    let nc = NotificationCenter.default
    nc.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    nc.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    
  }
  
  fileprivate func setupGestures() {
    vc.view.addGestureRecognizer(tap_dismissKeyboard)
    
  }
  
  @objc
  fileprivate func keyboardWillShow(_ notification: NSNotification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboard_frame = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboard_rect = keyboard_frame.cgRectValue
    for view in vc.view.subviews {
      guard let sv = view as? UIScrollView else {
        continue
      }
      if sv.isKind(of: UICollectionView.self) || sv.isKind(of: UITableView.self) {
        continue
      }
      var rect: CGRect = sv.frame
      rect.origin.y = 0
      rect.size.height -= keyboard_rect.height
      if let txt_active = txt_active {
        let inset: UIEdgeInsets = UIEdgeInsetsMake(0, 0, keyboard_rect.height + 30, 0)
        sv.contentInset = inset
        sv.scrollIndicatorInsets = inset
        if !rect.contains(txt_active.frame.origin) {
          sv.scrollRectToVisible(txt_active.frame, animated: true)
        }
      }
      if flag_scrollToBottom {
        sv.scrollRectToVisible(CGRect(x: 0, y: sv.contentSize.height, width: 1, height: 1), animated: true)
      }
      continue
    }
    
  }
  
  @objc
  fileprivate func keyboardWillHide(_ notification: NSNotification) {
    for v in vc.view.subviews {
      if let sv = v as? UIScrollView {
        let inset: UIEdgeInsets = UIEdgeInsets.zero
        sv.contentInset = inset
        sv.scrollIndicatorInsets = inset
        continue
      }
    }
    
  }
  
  @objc
  fileprivate func dismissKeyboardGestureTapped() {
    txt_active?.resignFirstResponder()
    
  }
  
}



//MARK: - Public
public extension AGKeyboardHelper {
  
  public func setActiveTextField(_ textField: UITextField) {
    txt_active = textField
  }
  
  public func removeActiveTextField() {
    txt_active = nil
  }
  
}



//MARK: - Private
extension AGKeyboardHelper {
  
  
  
}



//MARK: - UIGestureRecognizerDelegate
extension AGKeyboardHelper: UIGestureRecognizerDelegate {
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    guard tap_dismissKeyboard == gestureRecognizer else {
      return true
    }
    guard let v = touch.view, !v.isKind(of: UIControl.self) else {
      return false
    }
    return true
    
  }
  
}
