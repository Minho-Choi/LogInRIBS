//
//  LogOutBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogOutDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LogOutComponent: Component<LogOutDependency>, SignUpDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LogOutBuildable: Buildable {
    func build(withListener listener: LogOutListener) -> LogOutRouting
}

final class LogOutBuilder: Builder<LogOutDependency>, LogOutBuildable {

    override init(dependency: LogOutDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LogOutListener) -> LogOutRouting {
        let component = LogOutComponent(dependency: dependency)
        let viewController = LogOutViewController()
        let interactor = LogOutInteractor(presenter: viewController)
        interactor.listener = listener
        
        let signUpBuilder = SignUpBuilder(dependency: component)
        
        return LogOutRouter(interactor: interactor, viewController: viewController, signUpBuilder: signUpBuilder)
    }
}
