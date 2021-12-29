//
//  LogOutRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogOutInteractable: Interactable {
    var router: LogOutRouting? { get set }
    var listener: LogOutListener? { get set }
}

protocol LogOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LogOutRouter: ViewableRouter<LogOutInteractable, LogOutViewControllable>, LogOutRouting {
    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LogOutInteractable, viewController: LogOutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSignIn() {
        viewController.uiviewController.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    func routeToLogIn() {
        viewController.uiviewController.dismiss(animated: true, completion: nil)
    }
}
