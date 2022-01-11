//
//  RootBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>, LogOutDependency, LogInDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    let rootViewController: RootViewController

    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)
        
        let loggedOutBuilder = LogOutBuilder(dependency: component)
        let loggedInBuilder = LogInBuilder(dependency: component)

        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          logOutBuilder: loggedOutBuilder,
                          logInBuilder: loggedInBuilder)
        
    }
}
