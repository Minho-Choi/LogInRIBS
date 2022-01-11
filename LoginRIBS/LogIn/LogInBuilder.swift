//
//  LogInBuilder.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

protocol LogInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LogInComponent: Component<LogInDependency>, ADependency, BDependency, CDependency {
    
    let id: String
    
    init(dependency: LogInDependency, id: String) {
        self.id = id
        super.init(dependency: dependency)
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LogInBuildable: Buildable {
    func build(withListener listener: LogInListener, id: String) -> (router: LogInRouting, actionableItem: LogInActionableItem)
}

final class LogInBuilder: Builder<LogInDependency>, LogInBuildable {

    override init(dependency: LogInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LogInListener, id: String) -> (router: LogInRouting, actionableItem: LogInActionableItem) {
        let component = LogInComponent(dependency: dependency, id: id)
        let viewController = LogInViewController()
        let interactor = LogInInteractor(presenter: viewController, id: id)
        interactor.listener = listener
        
        let aBuilder = ABuilder(dependency: component)
        let bBuilder = BBuilder(dependency: component)
        let cBuilder = CBuilder(dependency: component)
        
        let router = LogInRouter(
            interactor: interactor,
            viewController: viewController,
            aBuilder: aBuilder, bBuilder: bBuilder, cBuilder: cBuilder)
        
        
        return (router, interactor)
    }
}
