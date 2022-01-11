//
//  ARouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol AInteractable: Interactable {
    var router: ARouting? { get set }
    var listener: AListener? { get set }
}

protocol AViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ARouter: ViewableRouter<AInteractable, AViewControllable>, ARouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AInteractable, viewController: AViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
