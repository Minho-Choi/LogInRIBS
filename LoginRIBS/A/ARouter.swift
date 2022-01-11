//
//  ARouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol AInteractable: Interactable, WebViewListener {
    var router: ARouting? { get set }
    var listener: AListener? { get set }
}

protocol AViewControllable: NavigateViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ARouter: ViewableRouter<AInteractable, AViewControllable>, ARouting {
    
    private var webViewBuilder: WebViewBuildable
    private var currentChild: ViewableRouting?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AInteractable, viewController: AViewControllable, webViewBuilder: WebViewBuildable) {
        self.webViewBuilder = webViewBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachWebView() {
        let url = Bundle.main.url(forResource: "test", withExtension: "html")
        if let url = url {
            let webRiblet = webViewBuilder.build(withListener: interactor, url: url)
            currentChild = webRiblet
            attachChild(webRiblet)
            viewController.presentViewController(viewController: webRiblet.viewControllable)
        }
    }
    
    func detachWebView() {
        if let currentChild = currentChild {
            viewController.dismissViewController(viewController: currentChild.viewControllable)
            detachChild(currentChild)
        }
    }
}
