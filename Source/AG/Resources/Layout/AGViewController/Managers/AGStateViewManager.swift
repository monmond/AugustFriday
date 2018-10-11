//
//  AGStateViewManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



public protocol AGStateViewDelegate: class {
  func agStateViewDidTapped(with state: AGStateViewModel.State)
}



public class AGStateViewManager {
  
  //MARK: - UI
  public var vc: (UIViewController & AGNavigationBarProtocol & AGStateViewProtocol)!
  public var v_state: AGStateView!
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  public weak var delegate_agStateView: AGStateViewDelegate?
  
  
  //MARK: - Storage
  fileprivate var state: AGStateViewModel.State = .normal
  fileprivate var viewModel: AGStateViewModel.ViewModel = AGStateViewModel.ViewModel()
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  
  public init(vc: (UIViewController & AGNavigationBarProtocol & AGStateViewProtocol),
              viewModel: AGStateViewModel.ViewModel) {
    self.vc = vc
    self.viewModel = viewModel
    
  }
  
  deinit {
    deposeView()
    
  }
  
}



//MARK: - Life Cycle
public extension AGStateViewManager {
  
  
  
}



//MARK: - Setup UI
public extension AGStateViewManager {
  
  fileprivate func setupView() {
    //    let bounds = vc.view.bounds
    //    let frame = CGRect(x: 0, y: height_navigationView, width: bounds.width, height: bounds.height - height_navigationView)
    //    v_state = AGStateView()
    //    v_state.frame = frame
    //    v_state.alpha = 0
    //    v_state.backgroundColor = BaseColor.clear.color
    //    v_state.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //    v_state.translatesAutoresizingMaskIntoConstraints = true
    //    vc.view.addSubview(v_state)
    
    v_state = AGStateView()
    v_state.alpha = 0
    v_state.backgroundColor = BaseColor.clear.color
    vc.view.addSubview(v_state)
    v_state.translatesAutoresizingMaskIntoConstraints = false
    
    if let top = vc.cons_agStateViewTopPinTo {
      v_state.topAnchor.constraint(equalTo: top).isActive = true
    } else {
      v_state.topAnchor.constraint(equalTo: vc.cons_topLayoutGuideTop).isActive = true
    }
    v_state.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor).isActive = true
    v_state.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor).isActive = true
    v_state.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor).isActive = true
    
  }
  
  fileprivate func setupGesture() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(gesturePressed(_:)))
    v_state.addGestureRecognizer(tap)
    
  }
  
  @objc
  fileprivate func gesturePressed(_ sender: UITapGestureRecognizer) {
    delegate_agStateView?.agStateViewDidTapped(with: state)
    
  }
  
}



//MARK: - Depose UI
public extension AGStateViewManager {
  
  fileprivate func deposeView() {
    vc = nil
    v_state = nil
    
  }
  
}



//MARK: - Common Function
public extension AGStateViewManager {
  
  public func create() {
    setupView()
    setupGesture()
    
  }
  
  public func removeFromSuperview() {
    v_state.removeFromSuperview()
    
  }
  
  public func show(isForce: Bool = false) {
    //    curveEaseIn
    let duration = isForce ? 0.0 : 0.1
    UIView.transition(with: v_state, duration: duration, options: .transitionCrossDissolve
      , animations: {
        self.v_state.alpha = 1
        self.v_state.v_container.alpha = 1
    }, completion: { _ in
      
    })
    
  }
  
  public func hide(_ onComplete: CallbackVoid? = nil) {
    UIView.transition(with: v_state, duration: 0.1, options: .transitionCrossDissolve
      , animations: {
        self.v_state.alpha = 0
        self.v_state.v_container.alpha = 0
    }, completion: { _ in
      onComplete?()
    })
    
  }
  
  public func setState(state: AGStateViewModel.State) {
    self.state = state
    var setting: AGStateViewModel.Setting
    switch state {
    case .normal:
      setting = viewModel.normal
    case .loading:
      setting = viewModel.loading
    case .noResults:
      setting = viewModel.noResults
    case .noConnection:
      setting = viewModel.noConnection
    case .error:
      setting = viewModel.error
    }
    v_state.setupData(with: setting)
    
  }
  
  public func show(with state: AGStateViewModel.State, isForce: Bool = false) {
    setState(state: state)
    show(isForce: isForce)
    
  }
  
}
