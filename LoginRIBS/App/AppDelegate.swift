//
//  AppDelegate.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import UIKit
import RIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let result = RootBuilder(dependency: AppComponent()).build()
        let launchRouter = result
        self.launchRouter = launchRouter

        launchRouter.launch(from: window)

        return true
    }

    // MARK: - Private

    private var launchRouter: LaunchRouting?
}
