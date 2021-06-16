//
//  LoginViewController.swift
//  TestsPDP
//
//  Created by Никита Лужбин on 16.06.2021.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Instance Properties

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!

    // MARK: - Instance Methods

    @IBAction private func onSignInButtonTouchUpInside(_ sender: UIButton) {
        self.navigateToMainViewController()
    }

    // MARK: -

    @objc private func textFieldDidChanged(_ textField: UITextField) {
        switch textField {
        case self.passwordTextField:
            guard let text = passwordTextField.text else {
                return
            }

            self.signInButton.isEnabled = PasswordValidator.shared.isValid(text: text)

        default:
            break
        }
    }

    private func navigateToMainViewController() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mainVC")

        window.rootViewController = vc

        UIView.transition(with: window,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }

    // MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()

        self.signInButton.layer.cornerRadius = 10
        self.signInButton.clipsToBounds = true
        self.signInButton.isEnabled = false

        self.passwordTextField.addTarget(self,
                                         action: #selector(self.textFieldDidChanged(_:)),
                                         for: .editingChanged)
    }
}
