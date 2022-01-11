//
//  RootRouter.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol RootInteractable: Interactable, LogOutListener, LogInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: NavigateViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let logOutBuilder: LogOutBuildable
    private let logInBuilder: LogInBuildable
    
    private var loggedOut: ViewableRouting?
    private var loggedIn: (router: LogInRouting, actionableItem: LogInActionableItem)?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
          viewController: RootViewControllable,
          logOutBuilder: LogOutBuildable,
          logInBuilder: LogInBuildable) {
        self.logOutBuilder = logOutBuilder
        self.logInBuilder = logInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        routeToLogOut()
    }

    func routeToLogIn(id: String) -> LogInActionableItem {
        if let loggedOut = loggedOut {
            viewController.dismissViewController(viewController: loggedOut.viewControllable)
            detachChild(loggedOut)
            self.loggedOut = nil
        }
        loggedIn = logInBuilder.build(withListener: interactor, id: id)
        guard let loggedIn = loggedIn else {
            fatalError("failed to allocate rib")
        }
        attachChild(loggedIn.router)
        viewController.presentViewController(viewController: loggedIn.router.viewControllable)
        return loggedIn.actionableItem
    }
    
    func routeToLogOut() {
        if let loggedIn = loggedIn {
            detachChild(loggedIn.router)
            viewController.dismissViewController(viewController: loggedIn.router.viewControllable)
            self.loggedIn = nil
        }
        let loggedOut = logOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.presentViewController(viewController: loggedOut.viewControllable)
    }
    
}
