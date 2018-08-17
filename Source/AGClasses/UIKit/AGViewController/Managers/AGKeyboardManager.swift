//
//  AGKeyboardManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public class AGKeyboardManager: NSObject {
  
  fileprivate var vc: UIViewController!
  public var txt_active: UITextField?
  fileprivate var tap_dismissKeyboard: UITapGestureRecognizer?
  public var scrollToBottomWhenKeyboardShows: Bool = false
  
  public init(vc: UIViewController) {
    self.vc = vc
  }
  
  deinit {
    deposeView()
    
  }
}



//MARK: - Life Cycle
extension AGKeyboardManager {
  
  
  
}



//MARK: - Setup
extension AGKeyboardManager {
  
  fileprivate func addKeyboardObservers() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    
  }
  
  fileprivate func removeKeyboardObservers() {
    NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
  }
  
  fileprivate func setupGesture() {
    tap_dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
    if let gesture = tap_dismissKeyboard {
      gesture.cancelsTouchesInView = false
      gesture.delegate = self
      vc.view.addGestureRecognizer(gesture)
    }
    
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
      if scrollToBottomWhenKeyboardShows {
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
  fileprivate func dismissKeyboard() {
    txt_active?.resignFirstResponder()
  }
  
}



//MARK: - Depose UI
extension AGKeyboardManager {
  
  fileprivate func deposeView() {
    removeKeyboardObservers()
    vc = nil
    txt_active = nil
    tap_dismissKeyboard = nil
    
  }
  
}



//MARK: - Common Function
extension AGKeyboardManager {
  
  public func create() {
    setupGesture()
    addKeyboardObservers()
    
  }
  
}



//MARK: - UIGestureRecognizerDelegate
extension AGKeyboardManager: UIGestureRecognizerDelegate {
  
  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    guard let tap = tap_dismissKeyboard, tap == gestureRecognizer else {
      return true
    }
    guard let v = touch.view, !v.isKind(of: UIControl.self) else {
      return false
    }
    return true
  }
  
}








