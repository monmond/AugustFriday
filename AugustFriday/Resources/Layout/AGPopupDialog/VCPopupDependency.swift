//
//  VCPopupDependency.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import PopupDialog



//MARK: - AGVCPopupDependency
protocol VCPopupDependency: AGVCPopupDependency {
  
  func displayPopupChoice(_ viewModel: ChoicePopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBBoolIndexPath?)
  func displayPopupConfirmText(_ viewModel: ConfirmTextPopupVM.ViewModel,
                               priority: AGPopupPriority,
                               on: UIViewController?,
                               onComplete: CBBoolString?)
  func displayPopupConfirm(_ viewModel: ConfirmPopupVM.ViewModel,
                           priority: AGPopupPriority,
                           on: UIViewController?,
                           onComplete: CBBool?)
  func displayPopupDialog(_ viewModel: ConfirmPopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBVoid?)
  func displaySheetChoice(_ viewModel: ChoicePopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBBoolIndexPath?)
  
}



//MARK: - Implements
extension VCPopupDependency {
  
  func displayPopupChoice(_ viewModel: ChoicePopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBBoolIndexPath? = nil) {
    guard popup(with: priority) else { return }
    let vc = ChoicePopupVC()
    vc.displayed = viewModel
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.flag_selected, vc.indexPath))
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .zoomIn,
                         tapGestureDismissal: true,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displayPopupConfirm(_ viewModel: ConfirmPopupVM.ViewModel,
                           priority: AGPopupPriority,
                           on: UIViewController?,
                           onComplete: CBBool? = nil) {
    guard popup(with: priority) else { return }
    let vc = ConfirmPopupVC()
    vc.displayed = viewModel
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete(vc.flag_selected)
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .bounceDown,
                         tapGestureDismissal: false,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displayPopupDialog(_ viewModel: ConfirmPopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBVoid? = nil) {
    guard popup(with: priority) else { return }
    let vc = ConfirmPopupVC()
    vc.displayed = viewModel
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete()
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .bounceDown,
                         tapGestureDismissal: false,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displayPopupConfirmText(_ viewModel: ConfirmTextPopupVM.ViewModel,
                               priority: AGPopupPriority,
                               on: UIViewController?,
                               onComplete: CBBoolString? = nil) {
    guard popup(with: priority) else { return }
    let vc = ConfirmTextPopupVC()
    vc.displayed = viewModel
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.flag_selected, vc.txt_frist.text ?? ""))
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .bounceDown,
                         tapGestureDismissal: false,
                         panGestureDismissal: true,
                         isAlignCenter: true,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  func displaySheetChoice(_ viewModel: ChoicePopupVM.ViewModel,
                          priority: AGPopupPriority,
                          on: UIViewController?,
                          onComplete: CBBoolIndexPath? = nil) {
    guard popup(with: priority) else { return }
    let vc = ChoicePopupVC()
    vc.h_scale = 0.3
    vc.displayed = viewModel
    let completion: CBVoid = {
      self.dismissed(with: priority)
      if let onComplete = onComplete {
        onComplete((vc.flag_selected, vc.indexPath))
      }
    }
    let pd = PopupDialog(viewController: vc,
                         transitionStyle: .zoomIn,
                         preferredWidth: UIScreen.main.bounds.width,
                         tapGestureDismissal: true,
                         panGestureDismissal: true,
                         isAlignCenter: false,
                         completion: completion)
    present(with: pd, priority: priority, on: on)
  }
  
  
}



//MARK: - Commons
extension VCPopupDependency {
  
}

