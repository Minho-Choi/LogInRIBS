//
//  CBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol CDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CComponent: Component<CDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CBuildable: Buildable {
    func build(withListener listener: CListener) -> CRouting
}

final class CBuilder: Builder<CDependency>, CBuildable {

    override init(dependency: CDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CListener) -> CRouting {
        let component = CComponent(dependency: dependency)
        let viewController = CViewController()
        let interactor = CInteractor(presenter: viewController)
        interactor.listener = listener
        return CRouter(interactor: interactor, viewController: viewController)
    }
}
