//
//  LogInInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift

protocol LogInRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LogInPresentable: Presentable {
    var listener: LogInPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LogInListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LogInInteractor: PresentableInteractor<LogInPresentable>, LogInInteractable, LogInPresentableListener {

    weak var router: LogInRouting?
    weak var listener: LogInListener?
    private var id: String

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: LogInPresentable, id: String) {
        self.id = id
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
    
    func getID() -> String {
        return id
    }
}
