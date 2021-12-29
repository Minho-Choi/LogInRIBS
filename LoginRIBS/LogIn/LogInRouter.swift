//
//  LogInRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogInInteractable: Interactable {
    var router: LogInRouting? { get set }
    var listener: LogInListener? { get set }
}

protocol LogInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LogInRouter: ViewableRouter<LogInInteractable, LogInViewControllable>, LogInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LogInInteractable, viewController: LogInViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
