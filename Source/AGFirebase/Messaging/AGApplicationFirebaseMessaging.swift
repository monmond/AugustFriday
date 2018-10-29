//
//  AGApplicationFirebaseMessaging.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 4/9/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import UserNotifications
import Firebase



//MARK: - AGApplicationFirebaseMessaging
public protocol AGApplicationFirebaseMessaging {
  
  var gcmMessageIDKey: String { get }
  func setupFirebaseMessaging(with application: UIApplication, delegate: MessagingDelegate & UNUserNotificationCenterDelegate)
  
}



//MARK: - Implements
public extension AGApplicationFirebaseMessaging {
  
  public var gcmMessageIDKey: String {
    return "gcm.message_id"
  }
  
  public func setupFirebaseMessaging(with application: UIApplication, delegate: MessagingDelegate & UNUserNotificationCenterDelegate) {
    Messaging.messaging().delegate = delegate
    if #available(iOS 10.0, *) {
      let options: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().delegate = delegate
      UNUserNotificationCenter.current().requestAuthorization(options: options) { isSuccess, error in
        
      }
    } else {
      let options: UIUserNotificationType = [.alert, .badge, .sound]
      let settings = UIUserNotificationSettings(types: options, categories: nil)
      application.registerUserNotificationSettings(settings)
    }
    application.registerForRemoteNotifications()
  }
  
}



//MARK: - Commons
public extension AGApplicationFirebaseMessaging {

}
