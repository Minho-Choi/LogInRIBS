//
//  RootInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift
import os

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToLogIn(id: String) -> LogInActionableItem
    func routeToLogOut()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener, RootActionableItem {

    weak var router: RootRouting?
    weak var listener: RootListener?
    private let loggedInActionableItemSubject = ReplaySubject<LogInActionableItem>.create(bufferSize: 1)
    private var isLoggedIn: Bool = false

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func routeToLogIn(id: String) {
        isLoggedIn = true
        let loggedInActionableItem = router?.routeToLogIn(id: id)
        if let loggedInActionableItem = loggedInActionableItem {
            loggedInActionableItemSubject.onNext(loggedInActionableItem)
        }
    }
    
    func dismissAndShowLogOut() {
        isLoggedIn = false
        router?.routeToLogOut()
    }
    
    func waitForLogin() -> Observable<(LogInActionableItem, ())> {
        return loggedInActionableItemSubject.map { (loggedInItem: LogInActionableItem) -> (LogInActionableItem, ()) in
            (loggedInItem, ())
        }
    }
}
