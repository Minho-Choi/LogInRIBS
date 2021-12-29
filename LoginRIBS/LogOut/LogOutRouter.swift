//
//  LogOutRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogOutInteractable: Interactable, SignUpListener {
    var router: LogOutRouting? { get set }
    var listener: LogOutListener? { get set }
}

protocol LogOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LogOutRouter: ViewableRouter<LogOutInteractable, LogOutViewControllable>, LogOutRouting {
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LogOutInteractable, viewController: LogOutViewControllable, signUpBuilder: SignUpBuildable) {
        self.signUpBuilder = signUpBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func routeToSignIn() {
        let signUp = signUpBuilder.build(withListener: interactor)
        self.currentChild = signUp
        attachChild(signUp)
        viewController.uiviewController.present(signUp.viewControllable.uiviewController, animated: true, completion: nil)
    }

    private let signUpBuilder: SignUpBuildable

    private var currentChild: ViewableRouting?
    
    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
        }
    }
}
