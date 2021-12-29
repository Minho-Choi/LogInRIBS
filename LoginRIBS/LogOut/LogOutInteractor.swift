//
//  LogOutInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift

protocol LogOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToSignIn()
}

protocol LogOutPresentable: Presentable {
    var listener: LogOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LogOutListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func routeToLogIn()
}

final class LogOutInteractor: PresentableInteractor<LogOutPresentable>, LogOutInteractable, LogOutPresentableListener {

    weak var router: LogOutRouting?
    weak var listener: LogOutListener?
    private var userDefaultsWorker: UserDefaultsWorkerProtocol

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LogOutPresentable) {
        userDefaultsWorker = UserDefaultsWorker()
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
    
    func logIn(id: String, password: String) -> LogInResult {
        guard let readResult = userDefaultsWorker.read(id: id) else {
            return LogInResult.idFailure
        }
        if readResult != password { return LogInResult.passwordFailure }
        return LogInResult.succes
    }
    
    func signInTapped() {
        router?.routeToSignIn()
    }
    
    func logInSuccess() {
        listener?.routeToLogIn()
    }
}
