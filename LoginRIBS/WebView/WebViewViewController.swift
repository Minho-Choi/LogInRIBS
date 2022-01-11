//
//  WebViewViewController.swift
//  LoginRIBS
//
//  Created by 60117642 on 2022/01/11.
//

import RIBs
import RxSwift
import UIKit
import WebKit

protocol WebViewPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func detach()
}

final class WebViewViewController: UIViewController, WebViewPresentable, WebViewViewControllable, WKUIDelegate {

    static var webView: WKWebView = WKWebView()
    weak var listener: WebViewPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebViewViewController.webView.uiDelegate = self
        configure()
    }
    
    func configure() {
        view.subviews.forEach { $0.removeFromSuperview() }
        WebViewViewController.webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(WebViewViewController.webView)
        NSLayoutConstraint.activate([
            WebViewViewController.webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            WebViewViewController.webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            WebViewViewController.webView.topAnchor.constraint(equalTo: view.topAnchor),
            WebViewViewController.webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func loadView(from request: URLRequest) {
        WebViewViewController.webView.load(request)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        listener?.detach()
    }
}
