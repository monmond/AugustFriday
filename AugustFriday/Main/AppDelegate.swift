//
//  AppDelegate.swift
//  AugustFriday
//
//  Created by sasawat sankosik on 15/6/18.
//  Copyright © 2018 ssankosik. All rights reserved.
//



import UIKit
import UserNotifications
import Firebase



//MARK: - Extensions
extension AppDelegate: UIApplicationDelegate { }
extension AppDelegate: UNUserNotificationCenterDelegate { }
extension AppDelegate: ApplicationSetup { }
extension AppDelegate: ApplicationRoutable { }
extension AppDelegate: ApplicationBlurable { }
extension AppDelegate: ApplicationFirebase { }
extension AppDelegate: ApplicationFirebaseMessaging { }
extension AppDelegate: MessagingDelegate { }



//MARK: - AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder {

  //MARK: - UI
  var window: UIWindow?
  
  
  
  //MARK: - NSLayout
  
  
  
  //MARK: - Constraint
  
  
  
  //MARK: - Instance
  
  
  
  //MARK: - Flag
  
  
  
  //MARK: - Storage
  
  

  //MARK: - Initial
  override init() {
    window = UIWindow(frame: UIScreen.main.bounds)
    super.init()
    onInit()
    
  }
  
  deinit {
    onDeinit()
    
  }

}



//MARK: - Core - UIApplicationDelegate
extension AppDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupBlurableObserverListeners()
    setupOnApplicationDidFinishLaunching()
    setupFirebase()
    setupFirebaseMessaging(with: application, delegate: self)
    start(with: launchOptions, condition: false)
    return true
    
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
    
  }

}



//MARK: - Life cycle
extension AppDelegate {
 
  fileprivate func onInit() {
    setupOnInit()
    
  }
  
  fileprivate func onDeinit() {
    setupOnDeinit()
    
  }
  
}




//MARK: MessagingDelegate
extension AppDelegate {
  
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
    Logger.logInfo("\(#function) - \(fcmToken)", scope: type(of: self))
    
  }
  
  func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
    Logger.logInfo("\(#function) - \(remoteMessage)", scope: type(of: self))
    
  }
  
}

