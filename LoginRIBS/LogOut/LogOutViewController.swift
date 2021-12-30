//
//  LogOutViewController.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift
import UIKit

enum LogInResult {
    case succes
    case idFailure
    case passwordFailure
}

protocol LogOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func logIn(id: String, password: String) -> LogInResult
    func signInTapped()
    func logInSuccess(id: String)
}

final class LogOutViewController: UIViewController, LogOutPresentable, LogOutViewControllable {

    weak var listener: LogOutPresentableListener?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!

    @IBAction func logInButtonDidTapped(_ sender: Any) {
        guard let id = idTextField.text, !id.isEmpty else {
            statusLabel.textColor = .red
            statusLabel.text = "ID를 입력하세요"
            return
        }
        guard let pw = pwTextField.text, !pw.isEmpty else {
            statusLabel.textColor = .red
            statusLabel.text = "Password를 입력하세요"
            return
        }
        switch listener?.logIn(id: id, password: pw) {
            case .idFailure:
                statusLabel.textColor = .red
                statusLabel.text = "ID를 확인하세요"
                return
            case .passwordFailure:
                statusLabel.textColor = .red
                statusLabel.text = "Password를 확인하세요"
                return
            case .succes:
                statusLabel.text = " "
                listener?.logInSuccess(id: id)
            case .none:
                assertionFailure("LogOutViewController Listener Empty")
        }
    }
    
    @IBAction func signInButtonDidTapped(_ sender: Any) {
        listener?.signInTapped()
    }
}
