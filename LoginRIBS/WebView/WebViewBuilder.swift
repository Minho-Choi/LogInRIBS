//
//  WebViewBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/11.
//

import RIBs

protocol WebViewDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WebViewComponent: Component<WebViewDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WebViewBuildable: Buildable {
    func build(withListener listener: WebViewListener, url: URL) -> WebViewRouting
}

final class WebViewBuilder: Builder<WebViewDependency>, WebViewBuildable {

    override init(dependency: WebViewDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WebViewListener, url: URL) -> WebViewRouting {
        let component = WebViewComponent(dependency: dependency)
        let viewController = WebViewViewController()
        let interactor = WebViewInteractor(presenter: viewController, url: url)
        interactor.listener = listener
        return WebViewRouter(interactor: interactor, viewController: viewController)
    }
}
