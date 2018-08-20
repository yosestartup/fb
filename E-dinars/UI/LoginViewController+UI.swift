//
//   LoginViewController+UI.swift
//   E-dinars
//
//   Created by Oleksandr Bambulyak on 11.07.2018.
//   Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
// swiftlint:disable function_body_length

import UIKit

// MARK: - UI
extension LoginViewController {
    func configureUI() {
        /// Delegates
        emailField.delegate = self
        passwordField.delegate = self
        
        /// Gesture
        let tapGestureKeyboard = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGestureKeyboard)
        
        /// View
        view.backgroundColor = UIColor.white
        
        /// Navigation
        self.navigationController?.isNavigationBarHidden = true
        
        /// Adding views
        view.addSubview(orangeHeader)
        view.addSubview(roundLogo)
        view.addSubview(loginText)
        view.addSubview(emailField)
        view.addSubview(orangeBar)
        view.addSubview(passwordField)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(loginButton)
        view.addSubview(separatorView)
        view.addSubview(firstIconLine)
        view.addSubview(secondIconLine)
        view.addSubview(bottomSignUpView)
        view.addSubview(badPasswordLabel)
        
        /// orangeBar
        orangeBar.backgroundColor = UIColor.kBloodOrange
        orangeBar.translatesAutoresizingMaskIntoConstraints = false
        orangeBar.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        orangeBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        orangeBar.bottomAnchor.constraint(equalTo: orangeHeader.topAnchor).isActive = true
        orangeBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        /// orangeHeader
        orangeHeader.backgroundColor = UIColor.kBloodOrange
        orangeHeader.translatesAutoresizingMaskIntoConstraints = false
        orangeHeader.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        orangeHeader.heightAnchor.constraint(equalToConstant: 56).isActive = true
        orangeHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        /// roundLogo
        roundLogo.widthAnchor.constraint(equalToConstant: 100).isActive = true
        roundLogo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        roundLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        roundLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roundLogo.backgroundColor = UIColor.white
        roundLogo.translatesAutoresizingMaskIntoConstraints = false
        roundLogo.layer.cornerRadius = 50
        roundLogo.layer.masksToBounds = true
        
        /// image
        let tempImage = UIImage(named: "icEdinar")
        let tempImageView = UIImageView(image: tempImage)
        tempImageView.translatesAutoresizingMaskIntoConstraints = false
        roundLogo.addSubview(tempImageView)
        tempImageView.centerXAnchor.constraint(equalTo: roundLogo.centerXAnchor).isActive = true
        tempImageView.centerYAnchor.constraint(equalTo: roundLogo.centerYAnchor).isActive = true
        tempImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        tempImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        /// loginText
        loginText.textColor = UIColor.kBloodOrange
        loginText.translatesAutoresizingMaskIntoConstraints = false
        loginText.text = "Login in E-Dinar"
        loginText.font = UIFont(name: "Helvetica", size: 16)
        loginText.textAlignment = .center
        loginText.topAnchor.constraint(equalTo: roundLogo.bottomAnchor, constant: 1).isActive = true
        loginText.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginText.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        /// emailField
        emailField.layer.cornerRadius = 5.0
        emailField.clipsToBounds = true
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.borderStyle = .roundedRect
        emailField.layer.borderColor = UIColor.kSeparator.cgColor
        emailField.attributedPlaceholder = NSAttributedString(
            string: "  e-mail",
            attributes: [.foregroundColor: UIColor.kTextGray, .font: UIFont.helvetica14
            ])
        emailField.layer.borderWidth = 1
        emailField.topAnchor.constraint(equalTo: loginText.bottomAnchor, constant: 45).isActive = true
        emailField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -37).isActive = true
        emailField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 38).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        /// passwordField
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "icVisibleInactive"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(passwordField.frame.size.width - 25),
                              y: CGFloat(5),
                              width: CGFloat(25),
                              height: CGFloat(25))
        button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        passwordField.rightView = button
        passwordField.rightViewMode = .always
        passwordField.layer.cornerRadius = 5.0
        passwordField.clipsToBounds = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.autocorrectionType = .no
        passwordField.borderStyle = .roundedRect
        passwordField.layer.borderColor = UIColor.kSeparator.cgColor
        passwordField.attributedPlaceholder = NSAttributedString(string: "  password", attributes: [
            .foregroundColor: UIColor.kTextGray,
            .font: UIFont.helvetica14
            ])
        passwordField.layer.borderWidth = 1
        /// passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15).isActive = true
        
        topPasswordFieldConstraint = passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15)
        topPasswordFieldConstraint?.isActive = true
        
        passwordField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -37).isActive = true
        passwordField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 38).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        /// badPasswordLabel
        badPasswordLabel.text = "Password is incorrect"
        badPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            badPasswordLabel.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -5),
            badPasswordLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            badPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            badPasswordLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 5)])
        
        badPasswordLabel.textColor = UIColor.kBloodOrange
        badPasswordLabel.font = UIFont(name: "Helvetica", size: 12)
        badPasswordLabel.textAlignment = .center
        badPasswordLabel.isHidden = true
    
        /// forgotPasswordLabel
        forgotPasswordLabel.textColor = UIColor.kBloodOrange
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttribute = [kCTUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Forgot password?",
                                                           attributes: underlineAttribute
                                                            as [NSAttributedStringKey: Any])
        forgotPasswordLabel.attributedText = underlineAttributedString
        forgotPasswordLabel.font = UIFont(name: "Helvetica", size: 14)
        forgotPasswordLabel.textAlignment = .center
        forgotPasswordLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(forgotPasswordHandling(tapGestureRecognizer:)))
        forgotPasswordLabel.addGestureRecognizer(tapGesture)
        forgotPasswordLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10).isActive = true
        forgotPasswordLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        forgotPasswordLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        /// loginButton
        loginButton.layer.backgroundColor = UIColor.kBloodOrange.cgColor
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.orange, for: .highlighted)
        loginButton.setTitleColor(UIColor.orange, for: .selected)
        loginButton.titleLabel?.textColor = UIColor.white
        loginButton.titleLabel?.font = UIFont(name: "Helvetica-Light", size: 20)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topButtonConstraint = loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 30)
        topButtonConstraint?.isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        loginButton.addTarget(self, action: #selector(self.loginClicked), for: .touchUpInside)
        
        /// separatorView
        separatorView.addSubview(separatorRightLine)
        separatorView.addSubview(separatorLeftLine)
        separatorView.addSubview(separatorLabel)
        separatorView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        separatorView.topAnchor.constraint(equalTo: loginButton.bottomAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separatorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        separatorLabel.textColor = UIColor.kTextGray
        separatorLabel.text = "or"
        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorLabel.font = UIFont(name: "Helvetica", size: 14)
        separatorLabel.textAlignment = .center
    
        separatorLeftLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLeftLine.backgroundColor = UIColor.greySeparator
        separatorLeftLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLeftLine.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        separatorRightLine.translatesAutoresizingMaskIntoConstraints = false
        separatorRightLine.backgroundColor = UIColor.greySeparator
        separatorRightLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorRightLine.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        separatorLabel.centerXAnchor.constraint(equalTo: separatorView.centerXAnchor).isActive = true
        separatorLabel.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor).isActive = true
        
        separatorLeftLine.rightAnchor.constraint(equalTo: separatorLabel.leftAnchor, constant: -12).isActive = true
        separatorLeftLine.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor).isActive = true
        
        separatorRightLine.leftAnchor.constraint(equalTo: separatorLabel.rightAnchor, constant: 12).isActive = true
        separatorRightLine.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor).isActive = true
        
        /// firstIconLine
        firstIconLine.translatesAutoresizingMaskIntoConstraints = false
        firstIconLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstIconLine.heightAnchor.constraint(equalToConstant: 30).isActive = true
        firstIconLine.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 10).isActive = true
        
        /// odnoklassnikiButton
        let odnoklassnikiButton = UIButton()
        odnoklassnikiButton.translatesAutoresizingMaskIntoConstraints = false
        odnoklassnikiButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        odnoklassnikiButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        odnoklassnikiButton.setImage(#imageLiteral(resourceName: "icOdnoklassniki"), for: .normal)
        firstIconLine.addSubview(odnoklassnikiButton)
        odnoklassnikiButton.leftAnchor.constraint(equalTo: firstIconLine.leftAnchor).isActive = true
        odnoklassnikiButton.centerYAnchor.constraint(equalTo: firstIconLine.centerYAnchor).isActive = true
        
        /// vkButton
        let vkButton = UIButton()
        vkButton.translatesAutoresizingMaskIntoConstraints = false
        vkButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        vkButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        vkButton.setImage(#imageLiteral(resourceName: "icVkontakte"), for: .normal)
        firstIconLine.addSubview(vkButton)
        vkButton.leftAnchor.constraint(equalTo: odnoklassnikiButton.rightAnchor, constant: 15).isActive = true
        vkButton.centerYAnchor.constraint(equalTo: firstIconLine.centerYAnchor).isActive = true
        
        /// twitterButton
        let twitterButton = UIButton()
        twitterButton.translatesAutoresizingMaskIntoConstraints = false
        twitterButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        twitterButton.setImage(#imageLiteral(resourceName: "icTwitter"), for: .normal)
        firstIconLine.addSubview(twitterButton)
        twitterButton.leftAnchor.constraint(equalTo: vkButton.rightAnchor, constant: 15).isActive = true
        twitterButton.centerYAnchor.constraint(equalTo: firstIconLine.centerYAnchor).isActive = true
        
        /// linkedInButton
        let linkedInButton = UIButton()
        linkedInButton.translatesAutoresizingMaskIntoConstraints = false
        linkedInButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        linkedInButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        linkedInButton.setImage(#imageLiteral(resourceName: "icLinkedin"), for: .normal)
        firstIconLine.addSubview(linkedInButton)
        linkedInButton.leftAnchor.constraint(equalTo: twitterButton.rightAnchor, constant: 15).isActive = true
        linkedInButton.centerYAnchor.constraint(equalTo: firstIconLine.centerYAnchor).isActive = true
        
        /// youtubeButton
        let youtubeButton = UIButton()
        youtubeButton.translatesAutoresizingMaskIntoConstraints = false
        youtubeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        youtubeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        youtubeButton.setImage(#imageLiteral(resourceName: "icYoutube"), for: .normal)
        firstIconLine.addSubview(youtubeButton)
        youtubeButton.leftAnchor.constraint(equalTo: linkedInButton.rightAnchor, constant: 15).isActive = true
        youtubeButton.centerYAnchor.constraint(equalTo: firstIconLine.centerYAnchor).isActive = true
        youtubeButton.rightAnchor.constraint(equalTo: firstIconLine.rightAnchor).isActive = true
        
        /// secondIconLine
        secondIconLine.translatesAutoresizingMaskIntoConstraints = false
        secondIconLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondIconLine.heightAnchor.constraint(equalToConstant: 30).isActive = true
        secondIconLine.topAnchor.constraint(equalTo: firstIconLine.bottomAnchor, constant: 15).isActive = true
        
        /// yandexButton
        let yandexButton = UIButton()
        yandexButton.translatesAutoresizingMaskIntoConstraints = false
        yandexButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        yandexButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        yandexButton.setImage(#imageLiteral(resourceName: "icYandex"), for: .normal)
        secondIconLine.addSubview(yandexButton)
        yandexButton.leftAnchor.constraint(equalTo: secondIconLine.leftAnchor).isActive = true
        yandexButton.centerYAnchor.constraint(equalTo: secondIconLine.centerYAnchor).isActive = true
        
        /// faceButton
        let faceButton = UIButton()
        faceButton.translatesAutoresizingMaskIntoConstraints = false
        faceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        faceButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        faceButton.setImage(#imageLiteral(resourceName: "icFacebook"), for: .normal)
        secondIconLine.addSubview(faceButton)
        faceButton.leftAnchor.constraint(equalTo: yandexButton.rightAnchor, constant: 15).isActive = true
        faceButton.centerYAnchor.constraint(equalTo: secondIconLine.centerYAnchor).isActive = true
        
        /// googleButton
        let googleButton = UIButton()
        googleButton.translatesAutoresizingMaskIntoConstraints = false
        googleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        googleButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        googleButton.setImage(#imageLiteral(resourceName: "icGoogle"), for: .normal)
        secondIconLine.addSubview(googleButton)
        googleButton.leftAnchor.constraint(equalTo: faceButton.rightAnchor, constant: 15).isActive = true
        googleButton.centerYAnchor.constraint(equalTo: secondIconLine.centerYAnchor).isActive = true
        
        /// instaButton
        let instaButton = UIButton()
        instaButton.translatesAutoresizingMaskIntoConstraints = false
        instaButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        instaButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        instaButton.setImage(#imageLiteral(resourceName: "icInstagram"), for: .normal)
        secondIconLine.addSubview(instaButton)
        instaButton.rightAnchor.constraint(equalTo: secondIconLine.rightAnchor).isActive = true
        instaButton.leftAnchor.constraint(equalTo: googleButton.rightAnchor, constant: 15).isActive = true
        instaButton.centerYAnchor.constraint(equalTo: secondIconLine.centerYAnchor).isActive = true
        
        /// bottomSignUoView
        bottomSignUpView.translatesAutoresizingMaskIntoConstraints = false
        bottomSignUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomSignUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -14).isActive = true
        
        /// dontHaveLabel
        let dontHaveLabel = UILabel()
        bottomSignUpView.addSubview(dontHaveLabel)
        dontHaveLabel.textColor = UIColor.kTextGray
        dontHaveLabel.text = "Don't have an account?"
        dontHaveLabel.translatesAutoresizingMaskIntoConstraints = false
        dontHaveLabel.font = UIFont(name: "Helvetica", size: 14)
        dontHaveLabel.textAlignment = .center
        bottomSignUpView.addSubview(dontHaveLabel)
        dontHaveLabel.topAnchor.constraint(equalTo: bottomSignUpView.topAnchor).isActive = true
        dontHaveLabel.bottomAnchor.constraint(equalTo: bottomSignUpView.bottomAnchor).isActive = true
        dontHaveLabel.leftAnchor.constraint(equalTo: bottomSignUpView.leftAnchor).isActive = true
        
        /// / signUpLabel
        let signUpLabel = UILabel()
        bottomSignUpView.addSubview(signUpLabel)
        signUpLabel.textColor = UIColor.kBloodOrange
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttributeSign = [kCTUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedStringSign = NSAttributedString(
                                                               string: "Sign Up",
                                                               attributes: underlineAttributeSign
                                                                as [NSAttributedStringKey: Any])
        signUpLabel.attributedText = underlineAttributedStringSign
        signUpLabel.font = UIFont(name: "Helvetica", size: 14)
        signUpLabel.textAlignment = .center
        signUpLabel.leftAnchor.constraint(equalTo: dontHaveLabel.rightAnchor, constant: 6).isActive = true
        signUpLabel.topAnchor.constraint(equalTo: bottomSignUpView.topAnchor).isActive = true
        signUpLabel.rightAnchor.constraint(equalTo: bottomSignUpView.rightAnchor).isActive = true
        signUpLabel.bottomAnchor.constraint(equalTo: bottomSignUpView.bottomAnchor).isActive = true
    }
}
