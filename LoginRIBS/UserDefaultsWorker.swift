//
//  UserDefaultsWorker.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import Foundation
import RIBs

protocol UserDefaultsWorkerProtocol {
    func read(id: String) -> String?
    func write(id: String, password: String)
}

class UserDefaultsWorker: Worker, UserDefaultsWorkerProtocol {
    
    func read(id: String) -> String? {
        return UserDefaults.standard.string(forKey: id)
    }
    
    func write(id: String, password: String) {
        UserDefaults.standard.set(password, forKey: id)
    }
}
