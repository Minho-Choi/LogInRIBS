//
//  AInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs
import RxSwift

protocol ARouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol APresentable: Presentable {
    var listener: APresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AInteractor: PresentableInteractor<APresentable>, AInteractable, APresentableListener {

    weak var router: ARouting?
    weak var listener: AListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: APresentable) {
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
