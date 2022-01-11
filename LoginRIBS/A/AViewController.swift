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
    func showWebView()
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
        
        let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Go Web", for: .normal)
            button.backgroundColor = .systemGray
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(webViewButtonDidTapped), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60)
        ])
    }
    
    @objc
    private func webViewButtonDidTapped() {
        listener?.showWebView()
    }
}
