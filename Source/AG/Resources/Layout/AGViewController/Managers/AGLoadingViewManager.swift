//
//  AGLoadingViewManager.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public class AGLoadingViewManager {
  
  fileprivate var v_loading: AGLoadingView!
  fileprivate var vc: UIViewController!
  
  fileprivate var viewModel = AGLoadingViewModel.ViewModel()
  
  public init(vc: UIViewController, viewModel: AGLoadingViewModel.ViewModel) {
    self.vc = vc
    self.viewModel = viewModel
  }
  
  deinit {
    vc = nil
  }
  
}



//MARK: - Life Cycle
public extension AGLoadingViewManager {
  
  
  
}



//MARK: - Setup UI
public extension AGLoadingViewManager {

  fileprivate func setupView() {
    v_loading = AGLoadingView()
    v_loading.isHidden = true
    v_loading.alpha = 0
    v_loading.iv_center.stopAnimating()
    v_loading.frame = vc.view.bounds
    v_loading.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    v_loading.translatesAutoresizingMaskIntoConstraints = true
    vc.view.addSubview(v_loading)
  }
  
}



//MARK: - Depose UI
public extension AGLoadingViewManager {
  
  fileprivate func deposeView() {
    vc = nil
    
  }
  
}



//MARK: - Common Function
public extension AGLoadingViewManager {

  public func create() {
    setupView()
    v_loading.setupData(with: viewModel)
  }
  
  public func displayShowLoadingView(_ onComplete: CallbackVoid? = nil) {
    vc.view.bringSubview(toFront: v_loading)
    v_loading.isHidden = false
    v_loading.iv_center.startAnimating()
    UIView.transition(with: v_loading, duration: 0.5, options: .transitionCrossDissolve
      , animations: {
        self.v_loading.alpha = 1
    }, completion: { _ in
      onComplete?()
    })
    
  }
  
  public func displayHideLoadingView(_ onComplete: CallbackVoid? = nil) {
    v_loading.isHidden = true
    v_loading.iv_center.stopAnimating()
    UIView.transition(with: v_loading, duration: 0.2, options: .transitionCrossDissolve
      , animations: {
        self.v_loading.alpha = 0
    }, completion: { _ in
      onComplete?()
    })
  }

}
