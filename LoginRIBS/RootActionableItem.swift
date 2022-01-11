//
//  RootActionableItem.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/04.
//

import RxSwift

public protocol RootActionableItem: AnyObject {
    func waitForLogin() -> Observable<(LogInActionableItem, ())>
}
