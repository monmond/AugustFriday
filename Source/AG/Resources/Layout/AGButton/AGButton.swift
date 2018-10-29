//
//  AGButton.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 20/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
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
  var icon: UIImage { get set }
  
}



//MARK: - AGButtonAppearance
public struct AGButtonAppearance {
  
  public var lb_font: UIFont
  public var bg_alpha: CGFloat
  public var bgGradient_axis: NSLayoutConstraint.Axis
  public var bdGradient_axis: NSLayoutConstraint.Axis
  public var bd_radius: CGFloat?
  public var bd_width: CGFloat
  public var ic_style: AGButtonIconStyle
  
  public init() {
    lb_font = UIFont.preferredFont(forTextStyle: .body)
    bg_alpha = 1
    bgGradient_axis = .horizontal
    bdGradient_axis = .horizontal
    bd_radius = nil
    bd_width = 1
    ic_style = .icon
  }
  
}



//MARK: - AGButtonOption
public struct AGButtonOption {
  
  public var isSetupTitle: Bool
  public var isSetupBorder: Bool
  public var isSetupBorderGradient: Bool
  public var isSetupRadius: Bool
  public var isSetupBackground: Bool
  public var isSetupBackgroundGradient: Bool
  public var isSetupIcon: Bool
  public var isSetupBorderBottom: Bool
  public var isSetupSpinner: Bool
  public var flag_bouncing: Bool
  
  public init() {
    isSetupTitle = true
    isSetupBorder = false
    isSetupBorderGradient = false
    isSetupRadius = false
    isSetupBackground = false
    isSetupBackgroundGradient = false
    isSetupIcon = false
    isSetupBorderBottom = false
    isSetupSpinner = false
    flag_bouncing = false
  }
  
}



//MARK: - AGButtonColorState
public typealias AGButtonColorState = (normal: UIColor, highlighted: UIColor, disable: UIColor)
public typealias AGButtonCradientColorState = (normal: [UIColor], highlighted: [UIColor], disable: [UIColor])



//MARK: - AGButtonColor
public struct AGButtonColor {
  
  public var lb: AGButtonColorState
  public var bg: AGButtonColorState
  public var bgGradient: AGButtonCradientColorState
  public var bd: AGButtonColorState
  public var bdGradient: AGButtonCradientColorState
  public var ic: AGButtonColorState
  public var tint: UIColor
  public var spinner: UIColor
  public var spinnerBackground: UIColor
  
  public init() {
    lb = (normal: .black, highlighted: .black, disable: .black)
    bg = (normal: .clear, highlighted: .clear, disable: .clear)
    bgGradient = (normal: [.black, .white], highlighted: [.black, .white], disable: [.black, .white])
    bd = (normal: .black, highlighted: .black, disable: .black)
    bdGradient = (normal: [.black, .white], highlighted: [.black, .white], disable: [.black, .white])
    ic = (normal: .black, highlighted: .black, disable: .black)
    tint = UIColor.black
    spinner = UIColor.black
    spinnerBackground = UIColor.white
    
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






//MARK: - Extension
extension AGButton: AGBouncingView { }



//MARK: - Storage
public class AGButton: UIButton {
  
  //MARK: - UI
  fileprivate var l_border = CALayer()
  fileprivate var l_borderGradient = CAGradientLayer()
  fileprivate var l_gradient = CAGradientLayer()
  fileprivate var l_spiner = AGSpinerLayer()
  var l_sublayers: [CALayer] {
    return [l_border, l_borderGradient, l_gradient]
  }
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  fileprivate let springGoEase: CAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0.45, -0.36, 0.44, 0.92)
  fileprivate let shrinkCurve: CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
  fileprivate let expandCurve: CAMediaTimingFunction = CAMediaTimingFunction(controlPoints: 0.95, 0.02, 1, 0.05)
  fileprivate let shrinkDuration: CFTimeInterval = 0.1
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  fileprivate var flag_layouted = false
  fileprivate var flag_animating = false
  
  
  //MARK: - Storage
  fileprivate var cached_title: String? = ""
  fileprivate var cached_Image: UIImage?
  fileprivate var setting: AGButtonSetting = BaseButtonSetting()
  
  
  //MARK: - Initial
  
  
}



//MARK: - Life Cycle
public extension AGButton {
  
  public override var isEnabled: Bool {
    didSet {
      setupStyle()
    }
  }
  
  public override var isSelected: Bool {
    didSet {
      setupStyle()
    }
  }
  
  public override var isHighlighted: Bool {
    didSet {
      setupStyle()
    }
  }
  
  public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if setting.option.flag_bouncing {
      self.goSquash()
    }
    super.touchesBegan(touches, with: event)
    
  }
  
  public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if setting.option.flag_bouncing {
      self.goBouncing()
    }
    super.touchesEnded(touches, with: event)
    
  }
  
  public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    if setting.option.flag_bouncing {
      self.goIdentity()
    }
    super.touchesCancelled(touches, with: event)
    
  }
  
  public convenience init() {
    self.init(type: .custom)
    onInit()
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    onInit()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    if !flag_layouted {
      flag_layouted = true
      setupStyle()
    }
    l_spiner.setToFrame(self.frame)
  }
  
  func onInit() {
    layer.addSublayer(l_gradient)
    layer.addSublayer(l_borderGradient)
    layer.addSublayer(l_border)
    layer.addSublayer(l_spiner)
  }
  
}



//MARK: - Commons
public extension AGButton {
  
  fileprivate func arrangeSublayer() {
    
  }
  
  fileprivate func setupTitle() {
    let c = setting.color
    let a = setting.appearance
    setTitleColor(c.lb.normal, for: .normal)
    setTitleColor(c.lb.normal, for: .highlighted)
    setTitleColor(c.lb.disable, for: .disabled)
    titleLabel?.font = a.lb_font
    titleLabel?.adjustsFontForContentSizeCategory = true
    titleLabel?.adjustsFontSizeToFitWidth = true
    
  }
  
  fileprivate func setupBackground(opacity: CGFloat = 1) {
    let c = setting.color
    backgroundColor = UIColor.clear
    setBackgroundColor(c.bg.normal, for: .normal)
    setBackgroundColor(c.bg.highlighted, for: .highlighted)
    setBackgroundColor(c.bg.disable, for: .disabled)
    //    setBackgroundColor(c.bg.normal.withAlphaComponent(opacity), for: .normal)
    //    setBackgroundColor(c.bg.highlighted.withAlphaComponent(opacity), for: .highlighted)
    //    setBackgroundColor(c.bg.disable.withAlphaComponent(opacity), for: .disabled)
    //    if isEnabled {
    //      backgroundColor = color.bg_normal.color
    //    } else {
    //      backgroundColor = color.bg_disable.color
    //    }
    
  }
  
  fileprivate func setupBackgroundGradient() {
    let c = setting.color
    let a = setting.appearance
    let r = a.bd_radius ?? bounds.height / 2
    let shape = CAShapeLayer()
    shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
    switch a.bgGradient_axis {
    case .horizontal:
      l_gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
      l_gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    case .vertical:
      l_gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
      l_gradient.endPoint = CGPoint(x: 0.5, y: 0.1)
    }
    let colors: [UIColor]
    switch state {
    case .normal:
      colors = c.bgGradient.normal
    case .highlighted:
      colors = c.bgGradient.highlighted
    case .disabled:
      colors = c.bgGradient.disable
    default:
      colors = c.bgGradient.normal
    }
    l_gradient.frame = bounds
    l_gradient.mask = shape
    l_gradient.colors = colors.map({ $0.cgColor })
    layoutIfNeeded()
  }
  
  fileprivate func setupBorder(width: CGFloat = 1) {
    let c = setting.color
    layer.borderWidth = width
    if isEnabled {
      layer.borderColor = c.bd.normal.cgColor
    } else {
      layer.borderColor = c.bd.disable.cgColor
    }
  }
  
  fileprivate func setupBorderGradient() {
    let c = setting.color
    let a = setting.appearance
    let r = a.bd_radius ?? bounds.height / 2
    let shape = CAShapeLayer()
    shape.lineWidth = a.bd_width
    shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
    shape.strokeColor = UIColor.black.cgColor
    shape.fillColor = UIColor.clear.cgColor
    switch a.bdGradient_axis {
    case .horizontal:
      l_borderGradient.startPoint = CGPoint(x: 0.0, y: 0.5)
      l_borderGradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    case .vertical:
      l_borderGradient.startPoint = CGPoint(x: 0.5, y: 0.0)
      l_borderGradient.endPoint = CGPoint(x: 0.5, y: 0.1)
    }
    let colors: [UIColor]
    switch state {
    case .normal:
      colors = c.bdGradient.normal
    case .highlighted:
      colors = c.bdGradient.highlighted
    case .disabled:
      colors = c.bdGradient.disable
    default:
      colors = c.bdGradient.normal
    }
    l_borderGradient.frame = bounds
    l_borderGradient.mask = shape
    l_borderGradient.colors = colors.map({ $0.cgColor })
    layoutIfNeeded()
  }
  
  
  fileprivate func setupRadius() {
    let a = setting.appearance
    let r = a.bd_radius ?? bounds.height / 2
    layer.cornerRadius = r
    clipsToBounds = true
  }
  
  fileprivate func setupBorderBottom() {
    let c = setting.color
    if isEnabled {
      addBorder(.bottom, color: c.bd.normal, width: 1)
    } else {
      addBorder(.bottom, color: c.bd.disable, width: 1)
    }
  }
  
  fileprivate func addBorder(_ side: AGButtonBorderSides, color: UIColor, width: CGFloat) {
    let frame_w = frame.size.width
    let frame_h = frame.size.height
    l_border.backgroundColor = color.cgColor
    switch side {
    case .top:
      l_border.frame = CGRect(x: 0, y: 0, width: frame_w, height: width)
    case .bottom:
      l_border.frame = CGRect(x: 0, y: frame_h - width, width: frame_w, height: width)
    case .left:
      l_border.frame = CGRect(x: 0, y: 0, width: width, height: frame_h)
    case .right:
      l_border.frame = CGRect(x: frame_w - width, y: 0, width: width, height: frame_h)
    }
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
    let ic_nornal = ic.overlay(with: c.ic.normal)
    let ic_highlighted = ic.overlay(with: c.ic.normal)
    let ic_disable = ic.overlay(with: c.ic.disable)
    
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
    
    tintColor = c.tint
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
  
  fileprivate func setupSpinner() {
    let c = setting.color
    l_spiner.spinnerColor = c.spinner
    l_spiner.lineWidth = (frame.size.height / CGFloat(30)).rounded(.up)
    clipsToBounds  = true
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
    guard !flag_animating else { return }
    let o = setting.option
    let a = setting.appearance
    if o.isSetupTitle {
      setupTitle()
    }
    if o.isSetupRadius {
      setupRadius()
    }
    if o.isSetupBorder {
      setupBorder(width: a.bd_width)
    }
    if o.isSetupBorderGradient {
      setupBorderGradient()
    }
    if o.isSetupBorderBottom {
      setupBorderBottom()
    }
    if o.isSetupBackground {
      setupBackground(opacity: a.bg_alpha)
    }
    if o.isSetupBackgroundGradient {
      setupBackgroundGradient()
    }
    if o.isSetupIcon {
      setupIcon(iconStyle: setting.appearance.ic_style)
    }
    if o.isSetupSpinner {
      setupSpinner()
    }
    
  }
  
}



//MARK: - TransitionButton
//  Credit by Alaeddine M. on 11/1/15.
extension AGButton: UIViewControllerTransitioningDelegate, CAAnimationDelegate {
  
  public func startAnimation() {
    flag_animating = true
    isUserInteractionEnabled = false
    cached_title = title(for: .normal)
    cached_Image = image(for: .normal)
    setTitle("",  for: .normal)
    setImage(nil, for: .normal)
    for l in l_sublayers {
      l.isHidden = true
    }
    setBackgroundColor(setting.color.spinnerBackground, for: .normal)
    UIView.animate(withDuration: 0.1, animations: {
      self.layer.cornerRadius = self.frame.height / 2
    }, completion: { completed -> Void in
      self.flag_animating = false
      self.shrink()
      self.l_spiner.animation()
    })
  }
  
  public func stopAnimation(animationStyle: StopAnimationStyle = .normal,
                            revertAfterDelay delay: TimeInterval = 1.0,
                            completion: CBVoid? = nil) {
    let delayToRevert = max(delay, 0.2)
    switch animationStyle {
    case .normal:
      DispatchQueue.main.asyncAfter(deadline: .now() + delayToRevert) {
        self.setOriginalState(completion: completion)
      }
    case .shake:
      DispatchQueue.main.asyncAfter(deadline: .now() + delayToRevert) {
        self.setOriginalState(completion: nil)
        self.shakeAnimation(completion: completion)
      }
    case .expand:
      l_spiner.stopAnimation()
      expand(completion: completion, revertDelay: delayToRevert)
    }
  }
  
  private func shakeAnimation(completion: CBVoid?) {
    let keyFrame = CAKeyframeAnimation(keyPath: "position")
    let point = layer.position
    keyFrame.values = [NSValue(cgPoint: CGPoint(x: CGFloat(point.x), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x - 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: CGPoint(x: CGFloat(point.x + 5), y: CGFloat(point.y))),
                       NSValue(cgPoint: point)]
    
    keyFrame.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    keyFrame.duration = 0.7
    layer.position = point
    CATransaction.setCompletionBlock {
      self.flag_animating = false
      completion?()
    }
    layer.add(keyFrame, forKey: keyFrame.keyPath)
    CATransaction.commit()
  }
  
  private func setOriginalState(completion: CBVoid?) {
    let a = setting.appearance
    let r = a.bd_radius ?? bounds.height / 2
    animateToOriginalWidth(completion: completion)
    l_spiner.stopAnimation()
    setTitle(cached_title, for: .normal)
    setImage(cached_Image, for: .normal)
    for l in l_sublayers {
      l.isHidden = false
    }
    setBackgroundColor(setting.color.bg.normal, for: .normal)
    isUserInteractionEnabled = true
    layer.cornerRadius = r
  }
  
  private func animateToOriginalWidth(completion: CBVoid?) {
    flag_animating = false
    let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
    shrinkAnim.fromValue = bounds.height
    shrinkAnim.toValue = bounds.width
    shrinkAnim.duration = shrinkDuration
    shrinkAnim.timingFunction = shrinkCurve
    shrinkAnim.fillMode = kCAFillModeForwards
    shrinkAnim.isRemovedOnCompletion = false
    CATransaction.setCompletionBlock {
      completion?()
    }
    layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
    CATransaction.commit()
  }
  
  private func shrink() {
    let shrinkAnim = CABasicAnimation(keyPath: "bounds.size.width")
    shrinkAnim.fromValue = frame.width
    shrinkAnim.toValue = frame.height
    shrinkAnim.duration = shrinkDuration
    shrinkAnim.timingFunction = shrinkCurve
    shrinkAnim.fillMode = kCAFillModeForwards
    shrinkAnim.isRemovedOnCompletion = false
    layer.add(shrinkAnim, forKey: shrinkAnim.keyPath)
  }
  
  private func expand(completion: CBVoid?, revertDelay: TimeInterval) {
    let expandAnim = CABasicAnimation(keyPath: "transform.scale")
    let expandScale = (UIScreen.main.bounds.size.height/frame.size.height)*2
    expandAnim.fromValue = 1.0
    expandAnim.toValue = max(expandScale,26.0)
    expandAnim.timingFunction = expandCurve
    expandAnim.duration = 0.4
    expandAnim.fillMode = kCAFillModeForwards
    expandAnim.isRemovedOnCompletion = false
    CATransaction.setCompletionBlock {
      self.flag_animating = false
      completion?()
      DispatchQueue.main.asyncAfter(deadline: .now() + revertDelay) {
        self.setOriginalState(completion: nil)
        self.layer.removeAllAnimations()
      }
    }
    layer.add(expandAnim, forKey: expandAnim.keyPath)
    CATransaction.commit()
  }
  
}

