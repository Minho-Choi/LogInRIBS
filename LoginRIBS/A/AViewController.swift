//
//  AViewController.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/10.
//

import RIBs
import RxSwift
import UIKit

protocol APresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AViewController: UIViewController, APresentable, AViewControllable {

    weak var listener: APresentableListener?
    
    override func viewDidLoad() {
        configure()
    }
    
    func configure() {
        view.backgroundColor = .red
        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "A"
            label.font = .systemFont(ofSize: 48)
            label.textColor = .white
            return label
        }()
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
