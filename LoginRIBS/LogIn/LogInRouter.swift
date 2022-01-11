//
//  LogInRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogInInteractable: Interactable, AListener, BListener, CListener {
    var router: LogInRouting? { get set }
    var listener: LogInListener? { get set }
}

protocol LogInViewControllable: NavigateViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LogInRouter: ViewableRouter<LogInInteractable, LogInViewControllable>, LogInRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    
    private var currentChild: ViewableRouting?
    private let aBuilder: ABuildable
    private let bBuilder: BBuildable
    private let cBuilder: CBuildable
    
    init(
        interactor: LogInInteractable,
        viewController: LogInViewControllable,
        aBuilder: ABuildable, bBuilder: BBuildable, cBuilder: CBuildable) {
            self.aBuilder = aBuilder
            self.bBuilder = bBuilder
            self.cBuilder = cBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
            let initChild = aBuilder.build(withListener: interactor)
            attachChild(initChild)
            currentChild = initChild
    }
    
    func addRiblet(for name: String) -> ViewControllable? {
        if let currentChild = currentChild {
            detachChild(currentChild)
        }
        switch name {
            case "B":
                let b = bBuilder.build(withListener: interactor)
                attachChild(b)
                currentChild = b
                return b.viewControllable
            case "C":
                let c = cBuilder.build(withListener: interactor)
                attachChild(c)
                currentChild = c
                return c.viewControllable
            default:
                let a = aBuilder.build(withListener: interactor)
                attachChild(a)
                currentChild = a
                return a.viewControllable
        }
    }
    
    func removeCurrentRiblet() {
        currentChild?.viewControllable.uiviewController.dismiss(animated: true)
        if let currentChild = currentChild {
            detachChild(currentChild)
        }
    }
}
