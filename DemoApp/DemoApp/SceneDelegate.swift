//
//  SceneDelegate.swift
//  DemoApp
//
//  Created by Anton Boyarkin on 04/12/2019.
//  Copyright © 2019 ABSoftware. All rights reserved.
//

import UIKit
import SwiftUI
import CardValidator

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let cardNumbers = [
            "4929804463622139",
            "4929804463622138",
            "6762765696545485",
            "5212 1320 1229 1762",
            "6210 9480 0000 0029",
            "3400 6097 2721 842",
            "6011 8581 6869 4532",
            "4913312143560685",
            
            // Invalid numbers
            "1234 5678 9123 4567",
            "d3ks32 23 2390 jd84",
            "01234 5678 9123 4567",
            "1234 5678 912",
            "1234 5678 9123 4567 4567",
            "1234 5678 9123",
            "1234 5678 9123 4567 456",
            
            "6123451234567893", // from the ISO standard

            // Valid card numbers
            "4012111111111111",
            "378282246310005",
            "371449635398431",
            "378734493671000",
            "5610591081018250",
            "30569309025904",
            "38520000023237",
            "6011111111111117",
            "6011000990139424",
            "3530111333300000",
            "3566002020360505",
            "5555555555554444",
            "5105105105105100",
            "4111111111111111",
            "4012888888881881",
            "4222222222222",
            "5019717010103742",
            "6331101999990016"
        ]
        
        let cards = cardNumbers.map { CreditCard($0) }
        
        let contentView = CardsListView(cards: cards).environmentObject(FilterData())

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

