//
//  AppDelegate.swift
//  Football
//
//  Created by Александр Андреев on 01.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    public class var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    
    public var scores = 10000
    public var scoresInGame = 0
    
    public var ok = false
    
    public var currentPrice = ""
    public var currentNameButton = ""
    public var currentButton = UIButton()
    
    public var currentTShirt = "LightGreen"
    public var currentShorts = "Gray"
    public var currentBall = "StandartBall"
    
    //T-shirts
    public var isBuyTShirtBlack = false
    public var isBuyTShirtGreen = false
    public var isBuyTShirtPurple = false
    public var isBuyTShirtRed = false
    public var isBuyTShirtYellow = false
    
    
    //Shorts
    public var isBuyShortsBlack = false
    public var isBuyShortsBlue = false
    public var isBuyShortsLightBlue = false
    public var isBuyShortsOrange = false
    public var isBuyShortsWhite = false
    
    
    //Ball
    public var isBuyOrangeBall = false
    public var isBuyWhiteBall = false
    public var isBuyBlackBall = false
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

