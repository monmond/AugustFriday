//
//  AGViewController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



extension AGVC:
  UIBarPositioningDelegate,
  UIGestureRecognizerDelegate,
  AGVCEventable,
  AGVCSkeletonable,
  AGVCPopupDependency,
//  AGVCNotificationBannerDependency,
  AGObject
{ }



open class AGVC: UIViewController {
  
  //MARK: - UI
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  var color_navigationBarTint: UIColor = AG.C.mint
  
  
  
  //MARK: - Instance
  //  lazy var agReachabilityManager = AGReachabilityManager(vc: self)
  var helper_agTransitionVC: AGTransitionVCHelper?
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  
  override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - AGObservableVC
  public var isWillAppearCalled: Bool = false
  public var isDidAppearCalled: Bool = false
  public var isDidLoadCalled: Bool = false
  public var isWillDisappearCalled: Bool = false
  public var isDidDisappearCalled: Bool = false
  
  public var onWillAppear: LDVoid? = nil
  public var onDidAppear: LDVoid? = nil
  public var onDidLoad: LDVoid? = nil
  public var onWillDisappear: LDVoid? = nil
  public var onDidDisappear: LDVoid? = nil
  
  
  
  //MARK: - Life Cycle
  override open func viewDidLoad() {
    super.viewDidLoad()
    trigger(on: .didLoad)
    setupViewOnViewDidLoad()
    
  }
  
  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    trigger(on: .willAppear)
    setupViewOnWillAppear()
    
  }
  
  override open func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    trigger(on: .didAppear)
    setupViewOnDidAppear()
    
  }
  
  override open func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    trigger(on: .willDisappear)
    setupViewOnWillDisappear()
    
  }
  
  override open func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    trigger(on: .didDisappear)
    setupViewOnDidDisappear()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    AGLog.info()
    NotificationCenter.default.removeObserver(self)
    
  }
  
  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
    
  }
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  
  //MARK: - NetworkReachabilityManager
  
  
  
  //MARK: - Setup View
  fileprivate func setupViewOnViewDidLoad() {
    interactivePopGestureEnable()
    //    agReachabilityManager.setupObservers()
    
  }
  
  fileprivate func setupViewOnWillAppear() {
    
  }
  
  fileprivate func setupViewOnDidAppear() {
    
  }
  
  fileprivate func setupViewOnWillDisappear() {
    
  }
  
  fileprivate func setupViewOnDidDisappear() {
    
  }
  
  
  
  //MARK: - Setup Data
  fileprivate func setupDataOnViewDidLoad() {
    
  }
  
  
  
  //MARK: - Common Function
  
  
  
  //MARK: - Event
  @objc
  public func popButtonPressed(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc
  public func dismissButtonPressed(_ sender: Any) {
    var dissmiss = false
    if let nav = navigationController {
      if nav.viewControllers.count > 1 {
        nav.popViewController(animated: true)
      } else {
        dissmiss = true
      }
    } else {
      dissmiss = true
    }
    if dissmiss {
      dismiss(animated: true)
    }
  }
  
  
  
  //MARK: - Public
  
  
  
  //MARK: - Private
  public func interactivePopGestureEnable() {
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  public func interactivePopGestureDisable() {
    navigationController?.interactivePopGestureRecognizer?.delegate = nil
    navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
  
  
  
  //MARK: - Interaction & Presentation
  
  
  
  //MARK: - Display
  
  
  
  //MARK: - NVActivityIndicatorView
  //  func displayStartLoading() {
  //    self.stopAnimating()
  //    self.startAnimating()
  //  }
  //
  //  func displayStopLoading() {
  //    self.stopAnimating()
  //  }
  
  
  
  //MARK: - PopupDialog
  //  func displayNetworkingResponse(_ error: AFResponseHandler, _ onComplete: CBVoid) {
  //    switch error {
  //    case .unknown:
  //      //      PopupManager.shared.alert(title: error.title, message: error.description, onComplete: {
  //      //        if let onComplete = onComplete {
  //      //          onComplete()
  //      //        }
  //      //      })
  //      break
  //    default:
  //      break
  //    }
  //
  //  }
  //
  //  func displayNetworkingResponse(_ message: String, _ onComplete: CBVoid) {
  //    //    PopupManager.shared.alert(title: "Error", message: message, onComplete: onComplete)
  //
  //  }
  //
  //  func displayPopup(with localize: String, _ onComplete: CBVoid) {
  //    //    PopupManager.shared.alert(title: "Error", message: message, onComplete: onComplete)
  //
  //  }
  
  
  
  //MARK: - Router
  func routeToLogout() {
    
  }
  
  //  func routeToLogin() {
  
  //  }
  
  
  
  //MARK: Core - UIBarPositioningDelegate
  public func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
  
  
  
  //MARK: Core - UIBarPositioningDelegate
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    guard let gr = navigationController?.interactivePopGestureRecognizer, gr == gestureRecognizer else {
      return false
    }
    let count = navigationController?.viewControllers.count ?? 0
    return count > 1 ? true : false
  }
  
  
  
  //MARK: - Custom - Protocol
  
  
  
  //MARK: Pods - NVActivityIndicatorViewable
  
  
  
}












