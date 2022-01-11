//
//  WebViewRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/11.
//

import RIBs

protocol WebViewInteractable: Interactable {
    var router: WebViewRouting? { get set }
    var listener: WebViewListener? { get set }
}

protocol WebViewViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WebViewRouter: ViewableRouter<WebViewInteractable, WebViewViewControllable>, WebViewRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WebViewInteractable, viewController: WebViewViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
