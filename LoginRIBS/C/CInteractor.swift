//
//  CInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs
import RxSwift

protocol CRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol CPresentable: Presentable {
    var listener: CPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol CListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class CInteractor: PresentableInteractor<CPresentable>, CInteractable, CPresentableListener {

    weak var router: CRouting?
    weak var listener: CListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: CPresentable) {
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
}
