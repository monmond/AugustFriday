//
//  ViewController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//




//MARK: - Imports
import UIKit



//MARK: - ViewProtocol
protocol ViewProtocol {
  
}



//MARK: - Extensions
//extension ViewController: AGInstantiatable { }
extension ViewController: ViewProtocol { }
extension ViewController: AGStateViewDelegate { }




//MARK: - ViewController
class ViewController: UIViewController {
  
  //MARK: - AGInstantiatable
//  static var sb_name: String = "Main"
//  static var vc_name: String = "ViewController"
//  var onViewDidLoad: LDVoid?
//  var onViewWillAppear: LDVoid?
//  var onViewDidAppear: LDVoid?
  
  
  
  //MARK: - UI
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Bussiness Model
  
  
  
  //MARK: - View Model
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Event
  
  
  
  deinit {
    
  }
  
}



//MARK: - Life Cycle
extension ViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupNavigationItem()
    setupObserver()
    setupTableView()
    setupStateView()
    fetchData()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
  }
  
}



//MARK: - Setup UI
extension ViewController {
  
  fileprivate func setupViewDidLoad() {
    setupView()
    setupNavigationItem()
    setupObserver()
    setupTableView()
    setupStateView()
    
  }
  
  fileprivate func setupView() {
    
  }
  
  fileprivate func setupNavigationItem() {
    navigationItem.title = "View"
    
  }
  
  fileprivate func setupObserver() {
    
  }
  
  fileprivate func setupConfiguration() {
    
  }
  
  fileprivate func setupScrollView() {
    
  }
  
  fileprivate func setupGesture() {
    
  }
  
  fileprivate func setupTextField() {
    
  }
  
  fileprivate func setupButton() {
    
  }
  
  fileprivate func setupLocalize() {
    
  }
  
  fileprivate func setupTableView() {
    
  }
  
  fileprivate func setupStateView() {
    
  }
  
}



//MARK: - Depose UI
extension ViewController {
  
  fileprivate func deposeView() {
    
    
  }
  
}



//MARK: - Commons
extension ViewController {
  
  
}



//MARK: - Interactor + Presenter
extension ViewController {
  
  fileprivate func fetchData() {
    
  }
  
}



//MARK: - Bussiness Logic
extension ViewController {
  
  
}



//MARK: - Display Logic
extension ViewController {
  
  func displayStartLoading(isForce: Bool = false, _ onComplete: CBVoid? = nil) {
    
  }
  
  func displayStopLoading(_ onComplete: CBVoid? = nil) {
    
  }
  
}



//MARK: - AGStateViewDelegate
extension ViewController {
  
  func stateViewPressed(with stateView: AGStateView, state: AGStateViewState) {
    
  }
  
}



