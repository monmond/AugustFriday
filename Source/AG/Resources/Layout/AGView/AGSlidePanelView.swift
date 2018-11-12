//
//  AGSlidePanelView.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit



//MARK: - Typealias
public typealias AGSlidePanelStateChange = (current: AGSlidePanelState, new: AGSlidePanelState)
public typealias AGSlidePanelPositionY = (panal: CGFloat, tabBar: CGFloat)



//MARK: - AGSlidePanelState
public enum AGSlidePanelState {
  case opened
  case docked
  case closed
}




//MARK: - AGViewTrasitionable
public protocol AGViewTrasitionable {
  func agViewAnimateUIVertical()
  func agViewAnimateUIHorizontal()
  func agViewTransitionUIVertical(with percent: CGFloat)
  func agViewTrasitionUIHorizontal(with percentage: CGFloat)
}



//MARK: - AGSlidePanelTrasitionable
public protocol AGSlidePanelTrasitionable {
  func agSlidePanelAnimateUIVertical(with states: AGSlidePanelStateChange)
  func agSlidePanelAnimateUIHorizontal(with states: AGSlidePanelStateChange)
  func agSlidePanelTransitionUIVertical(with percent: CGFloat)
  func agSlidePanelTrasitionUIHorizontal(with percentage: CGFloat)
}



//MARK: - Implements
public extension AGSlidePanelTrasitionable {
  
  public func agSlidePanelAnimateUIByOrientation(with states: AGSlidePanelStateChange) {
    if UIApplication.shared.statusBarOrientation.isPortrait {
      agSlidePanelAnimateUIVertical(with: states)
    } else if UIApplication.shared.statusBarOrientation.isLandscape {
      agSlidePanelAnimateUIHorizontal(with: states)
    }
  }
  
  public func agSlidePanelTrasitionUIByOrientation(with percent: CGFloat) {
    if UIApplication.shared.statusBarOrientation.isPortrait {
      agSlidePanelTransitionUIVertical(with: percent)
    } else if UIApplication.shared.statusBarOrientation.isLandscape {
      agSlidePanelTrasitionUIHorizontal(with: percent)
    }
  }
  
}



//MARK: - AGSlidePanelStateDelegate
// When the panel state is changed, the following delegate is called
// panelNewState: new state
// yPos: Y poisition of the panel at new state
public protocol AGSlidePanelStateDelegate: class {
  func panelStateChanged(to state: AGSlidePanelState)
}



//MARK: - AGSlidePanelAnimationDelegate
//These delegates are called when the UI Animation, which is responsbile to move the layouts, start and finish
public protocol AGSlidePanelAnimationDelegate: class {
  // withDuration: how long does the animation take
  // slidingUpCurrentPanelState: at what state the animation is going to take place
  // yPos: at what Y Position the animation is going to take place
  func panelAnimationStart(with duration: TimeInterval, states: AGSlidePanelStateChange)
  
  // withDuration: how long did it take
  // slidingUpCurrentPanelState: at what state the animation is finished
  // yPos: at what Y Position the animation is finished
  func panelAnimationFinished(with duration: TimeInterval, states: AGSlidePanelStateChange)
}



//MARK: - AGSlidePanelDraggingDelegate
public protocol AGSlidePanelDraggingDelegate: class {
  // when panel is began to be dragging by user
  // startYPos at what Y Position user began to drag the panel
  func panelStartDragging(startYPos: CGFloat)
  
  // When panel in being dragged by user
  // yPos: the center position of the panel
  func panelDraggingVertically(yPos: CGFloat, percent: CGFloat)
  
  // When user is done by dragging
  // Delta: if it's positive , it means panel was being dragged to the bottom of the screen
  //        if it's negative , it means panel was being dragged to the top of the screen
  func panelDraggingFinished(delta:  CGFloat)
}



//MARK: - AGSlidePanelConfiguration
public class AGSlidePanelConfiguration {
  public static let shared = AGSlidePanelConfiguration()
  public var height_dock: CGFloat = 49
  public var flag_isStickyTabBar: Bool = false
}



//MARK: - Extensions
extension AGSlidePanelView: AGVCEventable { }
extension AGSlidePanelView: AGPanningUtil { }



//MARK: - AGSlidePanelView
public class AGSlidePanelView: AGModelHelper {
  
  //MARK: - UI
  public weak var vc_parent: UIViewController!
  public weak var vc_child: UIViewController!
  public var v_container: UIView! // parent view
  public var v_panel: UIView! // slidingUp panel view
  public var tb: UITabBar! // tabBar
  public var pan_panel: UIPanGestureRecognizer!
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  public var y_dragStart: CGFloat! // Position of the beginning of dragging panel
  public var height_dock: CGFloat = AGSlidePanelConfiguration.shared.height_dock // Panel header
  public var duration_animation: TimeInterval = 0.35
  public var y_originTabBar: CGFloat! // The origin of tabbar
  public var y_dock: CGFloat { // y position of dock
    return v_container.frame.height - (height_tabBar + height_dock)
  }
  public var height_tabBar: CGFloat { // tabbar height
    return tb.frame.height
  }
  
  
  
  //MARK: - Instance
  public var delegate_panelState: AGSlidePanelStateDelegate?
  public var delegate_panelAnimation: AGSlidePanelAnimationDelegate?
  public var delegate_panelDragging: AGSlidePanelDraggingDelegate?
  
  
  
  //MARK: - Flag
  public var flag_isStickyTabBar: Bool = AGSlidePanelConfiguration.shared.flag_isStickyTabBar
  
  
  
  //MARK: - Storage
  public private(set) var state_slideUpPanel: AGSlidePanelState = .closed
  
  
  
  //MARK: - Initial
  public init(container parent: UIViewController, tabBar: UITabBar, panel child: UIViewController) {
    vc_parent = parent
    vc_child = child
    v_container = parent.view
    v_panel = child.view
    tb = tabBar
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



//MARK: - Life cycle
public extension AGSlidePanelView {
  
  public func viewDidLoad() {
    trigger(on: .didLoad)
    setupViewOnViewDidLoad()
    setupDataOnViewDidLoad()
    
  }
  
  public func resetPanel(child: UIViewController) {
    trigger(on: .willDisappear)
    NotificationCenter.default.removeObserver(self,
                                              name: UIDevice.orientationDidChangeNotification,
                                              object: nil)
    child.willMove(toParent: nil)
    child.removeFromParent()
    child.view.removeFromSuperview()
    child.didMove(toParent: nil)
    
    if let v = v_panel { v.removeFromSuperview() }
    v_container = nil
    v_panel = nil
    tb =  nil
    y_dragStart = nil
    y_originTabBar = nil
    state_slideUpPanel = .closed
    trigger(on: .didDisappear)
    
  }
  
  func onInit() {
    state_slideUpPanel = .closed
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(onOrientationChanged),
                                           name: UIDevice.orientationDidChangeNotification,
                                           object: nil)
  }
  
  func onDeinit() {
    NotificationCenter.default.removeObserver(self,
                                              name: UIDevice.orientationDidChangeNotification,
                                              object: nil)
  }
  
}



//MARK: - Setup View
public extension AGSlidePanelView {
  
  func setupViewOnViewDidLoad() {
    setupUI()
    setupSnp()
  }
  
  public func setupUI() {
    vc_parent.addChild(vc_child)
    v_container.insertSubview(v_panel, belowSubview: tb)
    vc_child.willMove(toParent: vc_parent)
    vc_child.didMove(toParent: vc_parent)
    
    pan_panel = UIPanGestureRecognizer(target: self, action: #selector(slideUpViewPanning))
    v_panel.addGestureRecognizer(pan_panel)
    
    y_originTabBar = tb != nil ? tb.frame.origin.y : v_container.frame.height
    v_panel.frame = CGRect(x: 0, y: v_container.frame.height,
                           width: UIScreen.main.bounds.size.width,
                           height: flag_isStickyTabBar ? v_container.frame.height - height_tabBar : v_container.frame.height)
    
  }
  
  func setupSnp() {
    
  }
  
  func setupUIVertically() {
    
  }
  
  func setupUIHorizontal() {
    
  }
  
}



//MARK: - Setup Data
public extension AGSlidePanelView {
  
  func setupDataOnViewDidLoad() {
    trigger(on: .willAppear)
    setSlideUpPanelState(to: .opened)
    
  }
  
}



//MARK: - Event
public extension AGSlidePanelView {
  
  @objc
  private func onOrientationChanged(_ sender: NotificationCenter) {
    guard isPanelCreated else { return }
    //TODO: - create delegate check prefered orentarion and update it
    //    setupUI()
  }
  
  @objc
  private func slideUpViewPanning(_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: v_container)
    let height = sender.view!.frame.height
    let min = height / 2
    let area_panable = height + min - height_dock
    let max = flag_isStickyTabBar ? area_panable : area_panable - height_tabBar
    let y = panningLocationRounded(with: sender.view!.center.y + translation.y, min: min, max: max)
    switch sender.state {
    case .began:
      y_dragStart = y
      delegate_panelDragging?.panelStartDragging(startYPos: y_dragStart)
    case .changed:
      let percent = 1 - panningLocationPercent(with: y, min: min, max: max, power: 4)
      delegate_panelDragging?.panelDraggingVertically(yPos: v_container.frame.origin.y, percent: percent)
      sender.view!.center = CGPoint(x: sender.view!.center.x, y: y)
      sender.setTranslation(CGPoint(x: 0, y: 0), in: v_container)
      guard let _ = tb, !flag_isStickyTabBar else { return }
      let min = height - height_tabBar
      let max = height
      tb.frame.origin.y = ((max - min) * percent) + min
    case .ended:
      let delta = y - y_dragStart
      delegate_panelDragging?.panelDraggingFinished(delta: delta)
      if delta > 0 {
        setSlideUpPanelState(to: .docked)
      } else {
        setSlideUpPanelState(to: .opened)
      }
    default:
      break
    }
  }
  
}



//MARK: - Public
public extension AGSlidePanelView {
  
  public var isPanelCreated: Bool {
    return v_container != nil && v_panel != nil
  }
  
  public func setSlideUpPanelState(to state: AGSlidePanelState) {
    animatePanel(y: getViewPositionY(with: state), to: state)
  }
  
  public var isPanelOpened: Bool {
    return state_slideUpPanel == .opened
  }
  
  public func scaleNumber(oldValue: CGFloat, newMin: CGFloat, newMax: CGFloat) -> CGFloat {
    let min = v_container.frame.height / 2
    let max = v_container.frame.height + min - height_tabBar + height_dock
    let oldRange = min - max
    let newRange = newMax - newMin
    return (((oldValue - min) * newRange) / oldRange) + newMin
    
  }
  
}



//MARK: - Private
public extension AGSlidePanelView {
  
  private func getViewPositionY(with state: AGSlidePanelState) -> AGSlidePanelPositionY {
    var y_v_panel: CGFloat
    var y_tb: CGFloat
    switch state {
    case .opened:
      y_v_panel = 0
      y_tb = v_container.frame.height
    case .docked:
      y_v_panel = y_dock
      y_tb = y_originTabBar
    case .closed:
      y_v_panel = v_container.frame.height
      y_tb = y_originTabBar
    }
    return (y_v_panel, y_tb)
  }
  
  private func animatePanel(y: AGSlidePanelPositionY, to state: AGSlidePanelState) {
    UIView.animate(withDuration: duration_animation, animations: { [weak self] in
      guard let _s = self else { return }
      _s.delegate_panelAnimation?.panelAnimationStart(with: _s.duration_animation,
                                                      states: (_s.state_slideUpPanel, state))
      _s.v_panel.frame.origin.y = y.panal
      if let _ = _s.tb, !_s.flag_isStickyTabBar {
        _s.tb.frame.origin.y = y.tabBar
      }
      
    }) { [weak self] completed in
      guard let _s = self else { return }
      _s.setSlideUpPanelState()
      _s.delegate_panelAnimation?.panelAnimationFinished(with: _s.duration_animation,
                                                         states: (_s.state_slideUpPanel, state))
    }
  }
  
  private func setSlideUpPanelState() {
    let y = v_panel.frame.origin.y
    if y == v_container.frame.height {
      state_slideUpPanel = .closed
    } else if y == y_dock {
      state_slideUpPanel = .docked
    } else {
      trigger(on: .didAppear)
      state_slideUpPanel = .opened
    }
    delegate_panelState?.panelStateChanged(to: state_slideUpPanel)
  }
  
}











