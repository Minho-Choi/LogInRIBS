//
//  AppComponent.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
