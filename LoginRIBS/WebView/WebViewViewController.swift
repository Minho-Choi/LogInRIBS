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
}

final class WebViewViewController: UIViewController, WebViewPresentable, WebViewViewControllable, WKUIDelegate {

    static var webView: WKWebView = WKWebView()
    weak var listener: WebViewPresentableListener?
    
    override func viewDidLoad() {
        WebViewViewController.webView.uiDelegate = self
    }
    
    func loadView(from request: URLRequest) {
        WebViewViewController.webView.load(request)
    }
}
