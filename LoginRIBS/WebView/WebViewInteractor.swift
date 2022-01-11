//
//  WebViewInteractor.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/11.
//

import RIBs
import RxSwift

protocol WebViewRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol WebViewPresentable: Presentable {
    var listener: WebViewPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func loadView(from request: URLRequest)
}

protocol WebViewListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func hideWebView()
}

final class WebViewInteractor: PresentableInteractor<WebViewPresentable>, WebViewInteractable, WebViewPresentableListener {

    weak var router: WebViewRouting?
    weak var listener: WebViewListener?
    
    private var url: URL

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: WebViewPresentable, url: URL) {
        self.url = url
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        presenter.loadView(from: URLRequest(url: url))
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func detach() {
        listener?.hideWebView()
    }
}
