//
//  AGNavigationBar.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 30/7/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit



public protocol AGNavigationBarProtocol {
  
  var isAGSearchController: Bool { get set }
  var isAGNavigationBarHidden: Bool { get set }
  
}



public extension AGNavigationBarProtocol {
  
  public var height_statusBar: CGFloat {
    return UIApplication.shared.statusBarFrame.maxY
  }
  
  public var height_navigationBar: CGFloat {
    return 44.0
  }
  
  public var height_searchBar: CGFloat {
    return 56.0
  }
  
  //  public var height_navigationView: CGFloat {
  //    var result: CGFloat = 0
  //    switch agNavigationBarAnchor {
  //    case .safeArea:
  //      result = statusBar + navigationBar
  //
  //    case .statueBar:
  //      result = statusBar
  //
  //    case .none:
  //      break
  //
  //    }
  //    if isAGSearchController {
  //      result += searchBar
  //    }
  //    return result
  //
  //  }
  //
  //  public var inset_safeAreaTop: CGFloat {
  //    return (isAGNavigationBarHidden ? -(height_navigationView * 2) : -height_navigationView)
  //  }
  
  
}



public extension AGNavigationBarProtocol where Self: UIViewController {
  
  public var cons_topLayoutGuideTop: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return view.safeAreaLayoutGuide.topAnchor
    } else {
      return topLayoutGuide.topAnchor
    }
  }
  
  public var cons_topLayoutGuideBot: NSLayoutYAxisAnchor {
    if #available(iOS 11.0, *) {
      return view.safeAreaLayoutGuide.topAnchor
    } else {
      return topLayoutGuide.bottomAnchor
    }
  }
  
}
