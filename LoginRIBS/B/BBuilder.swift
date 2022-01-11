//
//  BBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol BDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class BComponent: Component<BDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol BBuildable: Buildable {
    func build(withListener listener: BListener) -> BRouting
}

final class BBuilder: Builder<BDependency>, BBuildable {

    override init(dependency: BDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: BListener) -> BRouting {
        let component = BComponent(dependency: dependency)
        let viewController = BViewController()
        let interactor = BInteractor(presenter: viewController)
        interactor.listener = listener
        return BRouter(interactor: interactor, viewController: viewController)
    }
}
