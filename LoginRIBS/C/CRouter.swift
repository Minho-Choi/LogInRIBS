//
//  CRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol CInteractable: Interactable {
    var router: CRouting? { get set }
    var listener: CListener? { get set }
}

protocol CViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class CRouter: ViewableRouter<CInteractable, CViewControllable>, CRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: CInteractable, viewController: CViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
