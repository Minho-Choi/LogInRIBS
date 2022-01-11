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
    func getView(for tab: String) -> ViewControllable?
    func viewDidDisappear()
}

final class LogInViewController: UIViewController, LogInPresentable, LogInViewControllable, UITabBarDelegate {

    weak var listener: LogInPresentableListener?
    private var id: String = ""
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text = "hello, \(listener?.getID() ?? "ERROR")"
        tabBar.delegate = self
        guard let rtnView = listener?.getView(for: id)?.uiviewController.view else { return }
        rtnView.frame = self.contentView.bounds
        self.contentView.addSubview(rtnView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        listener?.viewDidDisappear()
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let id = item.title else { return }
        guard let rtnView = listener?.getView(for: id)?.uiviewController.view else { return }
        rtnView.frame = self.contentView.bounds
        self.contentView.addSubview(rtnView)
        contentView.setNeedsLayout()
    }
}
