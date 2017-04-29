//
//  AppDelegate.swift
//  3D Touch Demo
//
//  Created by Ossey on 2017/4/29.
//  Copyright © 2017年 Ossey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let shortcutItemType1Key = "shortcutItemType1"
    let shortcutItemType2Key = "shortcutItemType2"
    let shortcutItemType3Key = "shortcutItemType3"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // create item for tap app icon
        
        // add app menu item
        if #available(iOS 9.1, *) {
            let icon1 = UIApplicationShortcutIcon(templateImageName: "LuckyMoney_Shareicon_12x12_")
            let icon2 = UIApplicationShortcutIcon(type: .contact)
            let icon3 = UIApplicationShortcutIcon(type: .share)
            let item1 = UIMutableApplicationShortcutItem(type: shortcutItemType1Key, localizedTitle: "发送动态", localizedSubtitle: nil, icon: icon1, userInfo: nil)
            let item2 = UIMutableApplicationShortcutItem(type: shortcutItemType2Key, localizedTitle: "查看通讯录", localizedSubtitle: "", icon: icon2, userInfo: nil)
            let item3 = UIMutableApplicationShortcutItem(type: shortcutItemType3Key, localizedTitle: "分享", localizedSubtitle: nil, icon: icon3, userInfo: nil)
            application.shortcutItems = [item1, item2, item3]

        }
        
        return true
    }
    
    /// 点击app上标签item后，进入时对应事件的处理
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        switch shortcutItem.type {
        case shortcutItemType1Key:
            print("点击了audio")
            break
        case shortcutItemType2Key:
            print("点击了contact")
            break
        case shortcutItemType3Key:
            print("点击了favorite")
            break
        default:
            break
            
        }
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


}

