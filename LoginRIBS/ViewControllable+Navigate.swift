//
//  ViewControllable+Navigate.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/31.
//

import Foundation
import RIBs

protocol NavigateViewControllable: ViewControllable {
    func presentViewController(viewController: ViewControllable)
    func presentNavigationViewController(root: ViewControllable)
    func dismissViewController(viewController: ViewControllable)
    func pushViewController(viewController: ViewControllable)
    func popViewController(viewController: ViewControllable)
}

extension NavigateViewControllable {
    func presentViewController(viewController: ViewControllable) {
        uiviewController.present(viewController.uiviewController, animated: true, completion: nil)
    }
    func presentNavigationViewController(root: ViewControllable) {
        let navigation = UINavigationController(rootViewController: root.uiviewController)
        uiviewController.present(navigation, animated: true, completion: nil)
    }
    func dismissViewController(viewController: ViewControllable) {
        viewController.uiviewController.dismiss(animated: true, completion: nil)
    }
    func pushViewController(viewController: ViewControllable) {
        uiviewController.navigationController?.pushViewController(viewController.uiviewController, animated: true)
    }
    func popViewController(viewController: ViewControllable) {
        uiviewController.navigationController?.popToViewController(uiviewController, animated: true)
    }
}
