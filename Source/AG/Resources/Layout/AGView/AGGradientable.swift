//
//  AGGradientable.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 19/10/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



//MARK: - Imports
import UIKit


//MARK: - AGGradientModel
public struct AGGradientModel {
  
  public var color: [UIColor] = [UIColor.clear, UIColor.black]
  public var axis: NSLayoutConstraint.Axis = .horizontal
  
}



//MARK: - AGRadiusable
public protocol AGGradientable {
  
  var l_gradient: CAGradientLayer! { get set }
  var vm_gradient: AGGradientModel { get set }
  func setupGradient()
  func setupGradientOnLayoutSubviews()
  
}



//MARK: - Implements
public extension AGGradientable where Self: UIView {
  
  public func setupGradientOnLayoutSubviews() {
    l_gradient.frame = bounds
  }
  
  public mutating func setupGradient() {
    l_gradient = CAGradientLayer()
    switch vm_gradient.axis {
    case .horizontal:
      l_gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
      l_gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    case .vertical:
      l_gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
      l_gradient.endPoint = CGPoint(x: 0.5, y: 0.1)
    }
    l_gradient.frame = bounds
    l_gradient.colors = vm_gradient.color.map({ $0.cgColor })
    layer.insertSublayer(l_gradient, at: 0)
  }
  
}

//
////MARK: - TestGradientView
//open class TestGradientView: UIView, AGGradientable {
//
//
//
//  public var l_gradient: CAGradientLayer!
//  public var vm_gradient = AGGradientModel(color: [], axis: .horizontal)
//
//  open override func awakeFromNib() {
//    super.awakeFromNib()
//    setupGradient()
//  }
//
//  open override func layoutSubviews() {
//    super.layoutSubviews()
//    setupOnLayoutSubviews()
//  }
//
//  public func setupOnLayoutSubviews() {
//    l_gradient.frame = bounds
//  }
//
//  public func setupGradient() {
//    l_gradient = CAGradientLayer()
//    switch vm_gradient.axis {
//    case .horizontal:
//      l_gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
//      l_gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
//    case .vertical:
//      l_gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
//      l_gradient.endPoint = CGPoint(x: 0.5, y: 0.1)
//    }
//    l_gradient.frame = bounds
//    l_gradient.colors = vm_gradient.color.map({ $0.cgColor })
//    layer.insertSublayer(l_gradient, at: 0)
//  }
//
//}
