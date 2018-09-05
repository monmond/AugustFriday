//
//  AGViewController.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import NVActivityIndicatorView



//MARK: Extensions
extension AGVC: UIBarPositioningDelegate { }
extension AGVC: AGVCEventable { }
//extension AGVC: NVActivityIndicatorViewable { }



//MARK: - AGVC
class AGVC: UIViewController {
  
  //MARK: - UI
  //  @IBOutlet var v_navigationBar: UIView!
  //  @IBOutlet var v_loading: LoadingView!
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
//  lazy var agLoadingViewManager = AGLoadingViewManager(vc: self, viewModel: OMULoadingViewModel())
//  lazy var agReachabilityManager = AGReachabilityManager(vc: self)
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  
  
  //MARK: - Initial
  
  
  
  //MARK: - Event
  
  
  
  //MARK: - Initial
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
    
  }
  
  deinit {
    onDeinit()
  }
  
  
  
  //MARK: - AGObservableVC
  var isWillAppearCalled: Bool = false
  var isDidAppearCalled: Bool = false
  var isDidLoadCalled: Bool = false
  var isWillDisappearCalled: Bool = false
  var isDidDisappearCalled: Bool = false
  
  var onWillAppear: LambdaVoid? = nil
  var onDidAppear: LambdaVoid? = nil
  var onDidLoad: LambdaVoid? = nil
  var onWillDisappear: LambdaVoid? = nil
  var onDidDisappear: LambdaVoid? = nil
  
  
  
}



//MARK: - Life Cycle
extension AGVC {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    trigger(on: .didLoad)
    setupViewOnViewDidLoad()
    
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    trigger(on: .willAppear)
    setupViewOnWillAppear()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    trigger(on: .didAppear)
    setupViewOnDidAppear()
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    trigger(on: .willDisappear)
    setupViewOnWillDisappear()
    
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    trigger(on: .didDisappear)
    setupViewOnDidDisappear()
    
  }
  
  fileprivate func onInit() {
    
  }
  
  fileprivate func onDeinit() {
    NotificationCenter.default.removeObserver(self)
    
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
//    agLoadingViewManager.create()
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



//MARK: - Common Function
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
//  func displayNetworkingResponse(_ error: AFResponseHandler, _ onComplete: CallbackVoid) {
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
//  func displayNetworkingResponse(_ message: String, _ onComplete: CallbackVoid) {
//    //    PopupManager.shared.alert(title: "Error", message: message, onComplete: onComplete)
//
//  }
//
//  func displayPopup(with localize: String, _ onComplete: CallbackVoid) {
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



//MARK: Core - UIBarPositioningDelegate
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








