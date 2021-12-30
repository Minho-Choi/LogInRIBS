//
//  LogInViewController.swift
//  LoginRIBS
//
//  Created by 60117642 on 2021/12/29.
//

import RIBs
import RxSwift
import UIKit

protocol LogInPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func getID() -> String
}

final class LogInViewController: UIViewController, LogInPresentable, LogInViewControllable {

    weak var listener: LogInPresentableListener?
    private var id: String = ""
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "hello, \(listener?.getID() ?? "ERROR")"
    }
    
}
