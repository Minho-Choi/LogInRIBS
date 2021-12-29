//
//  SignUpViewController.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift
import UIKit

protocol SignUpPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func signUp(id: String, password: String) -> Bool
    func signUpDidEnded()
}

final class SignUpViewController: UIViewController, SignUpPresentable, SignUpViewControllable {

    weak var listener: SignUpPresentableListener?
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func signInButtonDIdTapped(_ sender: Any) {
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
        if let result = listener?.signUp(id: id, password: pw){
            if result {
                statusLabel.textColor = .green
                statusLabel.text = "회원가입 완료"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.listener?.signUpDidEnded()
                }
            } else {
                statusLabel.textColor = .red
                statusLabel.text = "사용할 수 없는 ID입니다"
            }
        } else {
            return
        }
    }
}
