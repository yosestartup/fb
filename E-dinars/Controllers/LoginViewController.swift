//
//  ViewController.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 03.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.

import UIKit

protocol LoginCoordinatorDelegate: class {
    func forgotPasswordAction(inViewController viewController: LoginViewController)
}

struct KeychainConfiguration {
    static let serviceName = "TouchMeIn"
    static let accessGroup: String? = nil
}

final class LoginViewController: UIViewController {
    /// UI
    let orangeHeader = UIView()
    let roundLogo = UIView()
    let loginText = UILabel()
    let emailField = UITextField()
    let orangeBar = UIView()
    let passwordField = UITextField()
    let badPasswordLabel = UILabel()
    let forgotPasswordLabel = UILabel()
    let loginButton = UIButton()
    let separatorView = UIView()
    let separatorLabel = UILabel()
    let separatorLeftLine = UIView()
    let separatorRightLine = UIView()
    let firstIconLine = UIView()
    let secondIconLine = UIView()
    let bottomSignUpView = UIView()
    
    var topButtonConstraint: NSLayoutConstraint?
    var topPasswordFieldConstraint: NSLayoutConstraint?
    
    /// Delegates
    weak var coordinatorDelegate: LoginCoordinatorDelegate?
    
    /// Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @IBAction func showAlertAction() {
//        let alertVC = CustomAlertViewController(
//            title: "How is your experience with Arccos?", message: "Tap a star to rate", image: #imageLiteral(resourceName: "icInfo"))
//
//        let cancelAction = AlertAction(title: "Cancel")
//        let doSmthAction = AlertAction(title: "Do smth") {
//        print("rgbfgbbgntb")
//        }
//
//        alertVC.addActions([cancelAction, doSmthAction])
//
//        alertVC.present(from: self)
    }
}

// MARK: - Logic
private extension LoginViewController {
    func badPasswordLabelIsHidden(state: Bool) {
        badPasswordLabel.isHidden = state
        
        let passwordFieldTop: CGFloat = state ? 15 : 25
        topPasswordFieldConstraint?.constant = passwordFieldTop
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Actions
extension LoginViewController {
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        emailField.endEditing(true)
        passwordField.endEditing(true)
    }
    
    @objc func forgotPasswordHandling(tapGestureRecognizer: UITapGestureRecognizer) {
        coordinatorDelegate?.forgotPasswordAction(inViewController: self)
    }
    
    @objc func refresh() {
        passwordField.isSecureTextEntry = !passwordField.isSecureTextEntry
    }
    
    @objc func loginClicked(_ sender: AnyObject?) {
        let state = emailField.text == "Allah"  && passwordField.text == "Allah"
        badPasswordLabelIsHidden(state: state)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailField.placeholder == "" {
            emailField.placeholder = "  e-mail"
        }
        
        if passwordField.placeholder == "" {
            passwordField.placeholder = "  password"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailField.isFirstResponder {
            emailField.placeholder = ""
        }
        
        if passwordField.isFirstResponder {
            passwordField.placeholder = ""
        }
    }
}
