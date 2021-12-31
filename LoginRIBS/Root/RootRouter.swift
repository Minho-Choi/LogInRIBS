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

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private let logOutBuilder: LogOutBuildable
    private let logInBuilder: LogInBuildable
    
    private var loggedOut: ViewableRouting?
    private var loggedIn: ViewableRouting?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
          viewController: RootViewControllable,
          logOutBuilder: LogOutBuildable,
          logInBuilder: LogInBuildable) {
        self.logOutBuilder = logOutBuilder
        self.logInBuilder = logInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        viewController.uiviewController.modalPresentationStyle = .fullScreen
    }
    
    override func didLoad() {
        routeToLogOut()
    }

    func routeToLogIn(id: String) {
        if let loggedOut = loggedOut {
            detachChild(loggedOut)
            loggedOut.viewControllable.uiviewController.dismiss(animated: true, completion: nil)
            self.loggedOut = nil
        }
        
        let loggedIn = logInBuilder.build(withListener: interactor, id: id)
        self.loggedIn = loggedIn
        attachChild(loggedIn)
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        viewController.uiviewController.present(loggedIn.viewControllable.uiviewController, animated: true, completion: nil)
    }
    
    func routeToLogOut() {
        if let loggedIn = loggedIn {
            detachChild(loggedIn)
            loggedIn.viewControllable.uiviewController.dismiss(animated: true, completion: nil)
            self.loggedIn = nil
        }
        let loggedOut = logOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.uiviewController.modalPresentationStyle = .fullScreen

        viewController.uiviewController.present(loggedOut.viewControllable.uiviewController, animated: true, completion: nil)
    }
    
}
