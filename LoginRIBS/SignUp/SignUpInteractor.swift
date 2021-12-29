//
//  SignUpInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift

protocol SignUpRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func dismiss()
}

protocol SignUpPresentable: Presentable {
    var listener: SignUpPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SignUpListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SignUpInteractor: PresentableInteractor<SignUpPresentable>, SignUpInteractable, SignUpPresentableListener {

    weak var router: SignUpRouting?
    weak var listener: SignUpListener?
    private var userDefaultsWorker: UserDefaultsWorkerProtocol

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SignUpPresentable) {
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
    
    func signUp(id: String, password: String) -> Bool {
        if userDefaultsWorker.read(id: id) == nil {
            userDefaultsWorker.write(id: id, password: password)
            return true
        } else {
            return false
        }
    }
    
    func signUpDidEnded() {
        router?.dismiss()
    }
}
