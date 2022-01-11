//
//  BInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs
import RxSwift

protocol BRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol BPresentable: Presentable {
    var listener: BPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol BListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class BInteractor: PresentableInteractor<BPresentable>, BInteractable, BPresentableListener {

    weak var router: BRouting?
    weak var listener: BListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: BPresentable) {
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
