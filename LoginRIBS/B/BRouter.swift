//
//  BRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol BInteractable: Interactable {
    var router: BRouting? { get set }
    var listener: BListener? { get set }
}

protocol BViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class BRouter: ViewableRouter<BInteractable, BViewControllable>, BRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: BInteractable, viewController: BViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
