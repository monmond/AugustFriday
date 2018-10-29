//
//  AGViewController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit
import NVActivityIndicatorView



//MARK: - Extensions
extension AGVC: UIBarPositioningDelegate { }
extension AGVC: AGVCEventable { }
//extension AGVC: NVActivityIndicatorViewable { }



//MARK: - AGVC
public class AGVC: UIViewController {
  
  //MARK: - UI
  //  @IBOutlet var v_navigationBar: UIView!
  //  @IBOutlet var v_loading: LoadingView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
//  lazy var agReachabilityManager = AGReachabilityManager(vc: self)
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    onInit()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
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
  
  
  
}



//MARK: - Life Cycle
extension AGVC {
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    trigger(on: .didLoad)
    setupViewOnViewDidLoad()
    
  }

  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    trigger(on: .willAppear)
    setupViewOnWillAppear()
    
  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    trigger(on: .didAppear)
    setupViewOnDidAppear()
    
  }
  
  override public func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    trigger(on: .willDisappear)
    setupViewOnWillDisappear()
    
  }
  
  override public func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    trigger(on: .didDisappear)
    setupViewOnDidDisappear()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    NotificationCenter.default.removeObserver(self)
    
  }
  
  override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
    
  }
  
}



//MARK: - NetworkReachabilityManager
extension AGVC {
  
  
  
}



//MARK: - Setup View
extension AGVC {
  
  fileprivate func setupViewOnViewDidLoad() {
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

}



//MARK: - Setup Data
extension AGVC {
  
  fileprivate func setupDataOnViewDidLoad() {
    
  }
  
}



//MARK: - Commons
extension AGVC {
  
}



//MARK: - Event
extension MainVC {
  
}



//MARK: - Public
extension MainVC {
  
}



//MARK: - Private
extension MainVC {
  
}



//MARK: - Interaction & Presentation
extension AGVC {
  
}



//MARK: - Display
extension AGVC {
  
  //  func displayStartLoading() {
  //    self.stopAnimating()
  //    self.startAnimating()
  //  }
  //
  //  func displayStopLoading() {
  //    self.stopAnimating()
  //  }
  
//  func displayCommonToast(message: String) {
//    view.makeToast(message)
//
//  }
//
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
//
//  //FIXME: Handle alamofire
//  func displayAGErrorToast(for error: AGError) {
//    var message: String?
//    switch error {
//    case let .alamofire(e) where e is AFError :
//      print(e)
//      message = AGLocalize.localized("kAlertRequestFailed")
//
//    case let .alamofire(e):
//      print(e)
//      message = AGLocalize.localized("kAlertRequestFailed")
//
//    case let .reachability(e):
//      print(e)
//      message = e.getDescription
//
//    case .timedOut:
//      message = "Timeout"
//
//    default:
//      break
//
//    }
//    if let m = message {
//      displayCommonToast(message: m)
//    }
//
//  }
//
//  func displayAlertRequestFailedToast() {
//    let message = AGLocalize.localized("kAlertRequestFailed")
//    displayCommonToast(message: message)
//
//  }
//
//  func displayAlertCannotConnectToServerToast() {
//    let message = AGLocalize.localized("kAlertNotConnectServer")
//    displayCommonToast(message: message)
//
//  }
 
}





//MARK: - Router
extension AGVC {
  
  func routeToLogout() {
    
  }
  
  //  func routeToLogin() {
  
  //  }
  
}



//MARK: - Core - UIBarPositioningDelegate
extension AGVC {
  
  public func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
  
}



//MARK: - Custom - Protocol
extension MainVC {
  
}



//MARK: Pods - NVActivityIndicatorViewable
extension AGVC {
  
}








