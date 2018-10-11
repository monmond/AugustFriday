//
//  ApplicationRouter.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//

import UIKit

public struct AGApplicationRouter {
  
  public static func openUrl(_ url: URL, onComplete: CallbackVoid? = nil) {
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url, options: [:], completionHandler: { _ in
        onComplete?()
      })
    } else {
      UIApplication.shared.openURL(url)
      onComplete?()
    }
  }
  
  public static func canOpenUrl(_ url: URL) -> Bool {
    return UIApplication.shared.canOpenURL(url)
  }
  
}
