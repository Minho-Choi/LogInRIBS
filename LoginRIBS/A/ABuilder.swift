//
//  ABuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs

protocol ADependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AComponent: Component<ADependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ABuildable: Buildable {
    func build(withListener listener: AListener) -> ARouting
}

final class ABuilder: Builder<ADependency>, ABuildable {

    override init(dependency: ADependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AListener) -> ARouting {
        let component = AComponent(dependency: dependency)
        let viewController = AViewController()
        let interactor = AInteractor(presenter: viewController)
        interactor.listener = listener
        return ARouter(interactor: interactor, viewController: viewController)
    }
}
