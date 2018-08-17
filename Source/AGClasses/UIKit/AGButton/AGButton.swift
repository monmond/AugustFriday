//
//  AGButton.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 20/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



//MARK: - StopAnimationStyle
public enum StopAnimationStyle {
  case normal
  case expand
  case shake
}



//MARK: - AGButtonSetting
public protocol AGButtonSetting {
  
  var appearance: AGButtonAppearance { get set }
  var option: AGButtonOption { get set }
  var color: AGButtonColor { get set }
  var icon: AGAsset { get set }
  
}



//MARK: - AGButtonAppearance
public struct AGButtonAppearance {
  
  public var lb_font: UIFont
  public var bg_alpha: CGFloat
  public var bd_radius: CGFloat?
  public var bd_width: CGFloat
  public var ic_style: AGButtonIconStyle
  
  public init() {
    lb_font = UIFont.systemFont(ofSize: 14)
    bg_alpha = 1
    bd_radius = nil
    bd_width = 1
    ic_style = .icon
  }
  
  public init(lb_font: UIFont = UIFont.systemFont(ofSize: 14),
              bg_alpha: CGFloat = 1,
              bd_radius: CGFloat? = nil,
              bd_width: CGFloat = 1,
              ic_style: AGButtonIconStyle = .icon) {
    self.lb_font = lb_font
    self.bg_alpha = bg_alpha
    self.bd_radius = bd_radius
    self.bd_width = bd_width
    self.ic_style = ic_style
  }
  
}



//MARK: - AGButtonOption
public struct AGButtonOption {
  
  public var isSetupTitle: Bool
  public var isSetupBorder: Bool
  public var isSetupRadius: Bool
  public var isSetupBackground: Bool
  public var isSetupIcon: Bool
  public var isSetupBorderBottom: Bool
  
  public init() {
    isSetupTitle = true
    isSetupBorder = false
    isSetupRadius = false
    isSetupBackground = true
    isSetupIcon = false
    isSetupBorderBottom = false
  }
  
  public init(isSetupTitle: Bool = true,
              isSetupBorder: Bool = false,
              isSetupRadius: Bool = false,
              isSetupBackground: Bool = true,
              isSetupIcon: Bool = false,
              isSetupBorderBottom: Bool = false) {
    self.isSetupTitle = isSetupTitle
    self.isSetupBorder = isSetupBorder
    self.isSetupRadius = isSetupRadius
    self.isSetupBackground = isSetupBackground
    self.isSetupIcon = isSetupIcon
    self.isSetupBorderBottom = isSetupBorderBottom
  }
  
}



//MARK: - AGButtonColor
public struct AGButtonColor {
  
  public var lb_normal: AGColor
  public var lb_hilighted: AGColor
  public var lb_disable: AGColor
  public var bg_normal: AGColor
  public var bg_hilighted: AGColor
  public var bg_disable: AGColor
  public var bd_normal: AGColor
  public var bd_disable: AGColor
  public var ic_normal: AGColor
  public var ic_disable: AGColor
  public var tint: AGColor
  
  public init() {
    lb_normal = BaseColor.black
    lb_hilighted = BaseColor.black
    lb_disable = BaseColor.black
    bg_normal = BaseColor.white
    bg_hilighted = BaseColor.white_two
    bg_disable = BaseColor.white
    bd_normal = BaseColor.white
    bd_disable = BaseColor.white
    ic_normal = BaseColor.black
    ic_disable = BaseColor.black
    tint = BaseColor.black
  }
  
  public init(lb_normal: AGColor = BaseColor.black,
              lb_hilighted: AGColor = BaseColor.black,
              lb_disable: AGColor = BaseColor.black,
              bg_normal: AGColor = BaseColor.white,
              bg_hilighted: AGColor = BaseColor.white_two,
              bg_disable: AGColor = BaseColor.white,
              bd_normal: AGColor = BaseColor.white,
              bd_disable: AGColor = BaseColor.white,
              ic_normal: AGColor = BaseColor.black,
              ic_disable: AGColor = BaseColor.black,
              tint: AGColor = BaseColor.black) {
    self.lb_normal = lb_normal
    self.lb_hilighted = lb_hilighted
    self.lb_disable = lb_disable
    self.bg_normal = bg_normal
    self.bg_hilighted = bg_hilighted
    self.bg_disable = bg_disable
    self.bd_normal = bd_normal
    self.bd_disable = bd_disable
    self.ic_normal = ic_normal
    self.ic_disable = ic_disable
    self.tint = tint
  }
  
}



//MARK: - AGButtonBorderSides
public enum AGButtonBorderSides {
  
  case top
  case bottom
  case left
  case right
  
}



//MARK: - AGButtonIconStyle
public enum AGButtonIconStyle {
  
  case icon
  case iconText_compact
  case textIcon_compact
  case iconText_flexible
  case textIcon_flexible
  
}



//MARK: - AGButtonStyle
public protocol AGButtonStyle {
  
  func getSetting() -> AGButtonSetting
  
}



//MARK: - Storage
public class AGButton: UIButton, AGBouncingView {
  
  fileprivate var setting: AGButtonSetting = BaseButtonSetting()
  fileprivate var buttonBorder = CALayer()
  fileprivate var layoutButton = false
  
  fileprivate let springGoEase: CAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0.45, -0.36, 0.44, 0.92)
  fileprivate let shrinkCurve: CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
  fileprivate let expandCurve: CAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
  fileprivate let shrinkDuration: CFTimeInterval = 0.1
  
  fileprivate var cached_title: String? = ""
  
  //  fileprivate lazy var spiner: SpinerLayer = {
  //    let spiner = SpinerLayer(frame: self.frame)
  //    self.layer.addSublayer(spiner)
  //    return spiner
  //  }()
  
}



//MARK: - Life Cycle
public extension AGButton {
  
  public override var isEnabled: Bool {
    didSet {
      self.setupStyle()
    }
  }
  
  public override var isSelected: Bool {
    didSet {
      self.setupStyle()
    }
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goSquash()
    super.touchesBegan(touches, with: event)
    
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goBouncing()
    super.touchesEnded(touches, with: event)
    
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.goIdentity()
    super.touchesCancelled(touches, with: event)
    
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    if !layoutButton {
      layoutButton = true
      self.setupStyle()
    }
    
    //    self.spiner.setToFrame(self.frame)
    
  }
  
}



//MARK: - Common Function
public extension AGButton {
  
  fileprivate func setupTitle() {
    
    let c = setting.color
    let a = setting.appearance
    setTitleColor(c.lb_normal.color, for: .normal)
    setTitleColor(c.lb_normal.color, for: .highlighted)
    setTitleColor(c.lb_disable.color, for: .disabled)
    titleLabel?.font = a.lb_font
    
  }
  
  fileprivate func setupBackground(opacity: CGFloat = 1) {
    
    let c = setting.color
    backgroundColor = BaseColor.clear.color
    setBackgroundColor(c.bg_normal.color(alpha: opacity), for: .normal)
    setBackgroundColor(c.bg_hilighted.color(alpha: opacity), for: .highlighted)
    setBackgroundColor(c.bg_disable.color(alpha: opacity), for: .disabled)
    //    if isEnabled {
    //      backgroundColor = color.bg_normal.color
    //    } else {
    //      backgroundColor = color.bg_disable.color
    //    }
    
  }
  
  fileprivate func setupBorder(width: CGFloat = 1) {
    
    let c = setting.color
    layer.borderWidth = width
    if isEnabled {
      layer.borderColor = c.bd_normal.cgColor
    } else {
      layer.borderColor = c.bd_disable.cgColor
    }
    
  }
  
  fileprivate func setupRadius(radius: CGFloat? = nil) {
    
    if let radius = radius {
      layer.cornerRadius = radius
    } else {
      layer.cornerRadius = bounds.height / 2
    }
    clipsToBounds = true
    
  }
  
  fileprivate func setupBorderBottom() {
    
    let c = setting.color
    if isEnabled {
      addBorder(.bottom, color: c.bd_normal.color, width: 1)
    } else {
      addBorder(.bottom, color: c.bd_disable.color, width: 1)
    }
    
  }
  
  fileprivate func addBorder(_ side: AGButtonBorderSides, color: UIColor, width: CGFloat) {
    
    let frame_w = frame.size.width
    let frame_h = frame.size.height
    buttonBorder.backgroundColor = color.cgColor
    switch side {
    case .top:
      buttonBorder.frame = CGRect(x: 0, y: 0, width: frame_w, height: width)
    case .bottom:
      buttonBorder.frame = CGRect(x: 0, y: frame_h - width, width: frame_w, height: width)
    case .left:
      buttonBorder.frame = CGRect(x: 0, y: 0, width: width, height: frame_h)
    case .right:
      buttonBorder.frame = CGRect(x: frame_w - width, y: 0, width: width, height: frame_h)
    }
    layer.addSublayer(buttonBorder)
    layoutIfNeeded()
    
  }
  
  fileprivate func setupIcon(iconStyle: AGButtonIconStyle) {
    
    let titleInset: UIEdgeInsets = .zero
    var imageInset: UIEdgeInsets = .zero
    let contentInset: UIEdgeInsets = .zero
    var alignment: UIControlContentHorizontalAlignment = .center
    var text_alignment: NSTextAlignment = .natural
    
    let c = setting.color
    let ic = setting.icon
    let ic_nornal = ic.image(c.ic_normal)
    let ic_highlighted = ic.image(c.ic_normal)
    let ic_disable = ic.image(c.ic_disable)
    
    switch iconStyle {
    case .icon:
      setTitle("", for: .normal)
      imageInset = UIEdgeInsets(top: 5,left: 0,bottom: 5,right: 0)
    case .iconText_compact:
      imageInset = UIEdgeInsets(top: 5,left: 0,bottom: 5,right: 10)
    case .textIcon_compact:
      // reverse cons
      imageInset = UIEdgeInsets(top: 5,left: 10,bottom: 5,right: 5)
      transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
      imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
    case .iconText_flexible:
      //in developping
      text_alignment = .center
      alignment = .left
      
    case .textIcon_flexible:
      //in developping
      text_alignment = .center
      alignment = .right
      
    }
    
    tintColor = c.tint.color
    imageView?.contentMode = .scaleAspectFit
    
    contentHorizontalAlignment = alignment
    contentVerticalAlignment = .center
    
    contentEdgeInsets = contentInset
    imageEdgeInsets = imageInset
    titleEdgeInsets = titleInset
    
    titleLabel?.textAlignment = text_alignment
    
    setImage(ic_nornal, for: .normal)
    setImage(ic_highlighted, for: .highlighted)
    setImage(ic_disable, for: .disabled)
    
  }
  
}



//MARK: - Setup UI
public extension AGButton {
  
  public func setup(_ style: AGButtonStyle) {
    self.setting = style.getSetting()
    setupStyle()
    
  }
  
  public func setup(_ setting: AGButtonSetting) {
    
    self.setting = setting
    setupStyle()
    
  }
  
  fileprivate func setupStyle() {
    
    let o = setting.option
    let a = setting.appearance
    if o.isSetupTitle {
      setupTitle()
    }
    if o.isSetupBorder {
      setupBorder(width: a.bd_width)
    }
    if o.isSetupRadius {
      setupRadius(radius: a.bd_radius)
    }
    if o.isSetupBackground {
      setupBackground(opacity: a.bg_alpha)
    }
    if o.isSetupIcon {
      setupIcon(iconStyle: setting.appearance.ic_style)
    }
    if o.isSetupBorderBottom {
      setupBorderBottom()
    }
    
  }
  
}



// MARK: - TransitionButton
//  Credit by Alaeddine M. on 11/1/15.
public extension AGButton {
  
  /**
   start animating the button, before starting a task, exemple: before a network call.
   */
  public func startAnimation() {
    self.isUserInteractionEnabled = false // Disable the user interaction during the animation
    
    self.cached_title = title(for: .normal)
    
    self.setTitle("",  for: .normal)
    self.setImage(nil, for: .normal)
    
    UIView.animate(withDuration: 0.1, animations: { () -> Void in
      self.layer.cornerRadius = self.frame.height / 2
    }, completion: { completed -> Void in
      // reduce the width to be equal to the height in order to have a circle
      self.shrink()
      // animate spinner
      //      self.spiner.animation()
    })
  }
  
  public func stopAnimation(animationStyle: StopAnimationStyle = .normal, revertAfterDelay delay: TimeInterval = 1.0, completion:(()->Void)? = nil) {
    
    switch animationStyle {
    case .normal:
      completion?()
      // We return to original state after a delay to give opportunity to custom transition
      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        self.setOriginalState()
      }
    case .shake:
      completion?()
      // We return to original state after a delay to give opportunity to custom transition
      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        self.setOriginalState()
        self.shakeAnimation()
      }
    case .expand:
      // before animate the expand animation we need to hide the spiner first
      //      self.spiner.stopAnimation()
      // scale the round button to fill the screen
      self.expand(completion: completion, revertDelay:delay)
    }
  }
  
  private func shakeAnimation() {
    
    let keyFrame = CAAnimation.KeyFrame.position
    let point = self.layer.position
    keyFrame.values = [NSValue(cgPoint: CGPoint(x: CGFloat(point.x), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 10), y: CGFloat(point.y))),
                       NSValue(cgPoint: point)]
    
    keyFrame.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    keyFrame.duration = 0.7
    self.layer.position = point
    self.layer.add(keyFrame, forKey: keyFrame.keyPath)
  }
  
  private func setOriginalState() {
    animateToOriginalWidth()
    //    spiner.stopAnimation()
    setTitle(self.cached_title, for: .normal)
    isUserInteractionEnabled = true // enable again the user interaction
    setupStyle()
  }
  
  private func animateToOriginalWidth() {
    let shrinkAnim = CAAnimation.Basic.Size.width
    shrinkAnim.fromValue = (self.bounds.height)
    shrinkAnim.toValue = (self.bounds.width)
    shrinkAnim.duration = shrinkDuration
    shrinkAnim.timingFunction = shrinkCurve
    shrinkAnim.fillMode = kCAFillModeForwards
    shrinkAnim.isRemovedOnCompletion = false
    self.layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
  }
  
  private func shrink() {
    
    let shrinkAnim                   = CAAnimation.Basic.Size.width
    shrinkAnim.fromValue             = frame.width
    shrinkAnim.toValue               = frame.height
    shrinkAnim.duration              = shrinkDuration
    shrinkAnim.timingFunction        = shrinkCurve
    shrinkAnim.fillMode              = kCAFillModeForwards
    shrinkAnim.isRemovedOnCompletion = false
    
    layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
  }
  
  private func expand(completion: CallbackVoid?, revertDelay: TimeInterval) {
    let expandAnim = CAAnimation.Basic.Transform.scale
    expandAnim.fromValue            = 1.0
    expandAnim.toValue              = 26.0
    expandAnim.timingFunction       = expandCurve
    expandAnim.duration             = 0.4
    expandAnim.fillMode             = kCAFillModeForwards
    expandAnim.isRemovedOnCompletion  = false
    
    CATransaction.setCompletionBlock {
      completion?()
      // We return to original state after a delay to give opportunity to custom transition
      DispatchQueue.main.asyncAfter(deadline: .now() + revertDelay) {
        self.setOriginalState()
        self.layer.removeAllAnimations() // make sure we remove all animation
      }
    }
    
    layer.add(expandAnim, forKey: expandAnim.keyPath)
    
    CATransaction.commit()
  }
  
}

