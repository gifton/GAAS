//
//  SignUpView.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class SignUpView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildSkeleton()
        addVerticalGradientLayer(topColor: .black, bottomColor: .darkGray)
    }
    
    let icon : UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .clear
        img.setHeightWidth(width: 70, height: 70)
        img.image = #imageLiteral(resourceName: "icon")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let emailField : UITextField = {
        let tv = UITextField()
        let paddingEmail = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.backgroundColor = .clear
        tv.textColor = .offWhite
        tv.addBorders(edges: [.bottom], color: .offWhite)
        tv.setHeightWidth(width: UIScreen.main.bounds.width, height: 50)
        tv.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.leftView = paddingEmail
        tv.leftViewMode = .always
        
        return tv
    }()
    let passwordField : UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .clear
        tv.textColor = .offWhite
        tv.setHeightWidth(width: UIScreen.main.bounds.width, height: 50)
        tv.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.addBorders(edges: [.bottom], color: .offWhite)
        let paddingPassword = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.leftViewMode = .always
        tv.leftView = paddingPassword
        tv.isSecureTextEntry = true
        tv.isHidden = true
        
        return tv
    }()
    let signInButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .mainBlue
        btn.setTitle("Get started", for: UIControlState())
        btn.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 15).isActive = true
        btn.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        return btn
    }()
    let stackView = UIStackView()

    var loginAlert : UIView!
    fileprivate func buildSkeleton() {
        self.loginAlert = AlertView(frame: CGRect(x: (UIScreen.main.bounds.width - 175) / 2, y: (UIScreen.main.bounds.height - 175) / 2, width: 175, height: 175))
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(signInButton)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        loginAlert.alpha = 0.0
        
        self.addSubview(stackView)
        self.addSubview(icon)
        insertSubview(loginAlert, at: 99999)
        stackView.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 200)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            loginAlert.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginAlert.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapGetStarted(_ sender: UIButton) {
        print("Button clicked")
        let test = SignUpViewController()
        test.testFunc()
        Auth.auth().fetchProviders(forEmail: emailField.text!) { (response, error) in
            //if there is an issue with calling firebase....
            if (error != nil) {
                print("error with auth:\(String(describing: error))")
                self.remove(self.signInButton)
            } else {
                //if there is an account associated with this email
                if response == nil {
                    print ("email account could not be validated")
                    UIView.animate(withDuration: 2.5, animations: {
                        self.loginAlert.alpha = 1.0
                        self.remove(self.signInButton)
                    })
                } else {
                    print ("account is validated...")
                    
                }
            }
        }
        
        let user = userHasAccount(email: emailField.text!)
        print ("response is: \(user)")
    }
    @objc func remove(_ button : UIButton) {
        UIView.animate(withDuration: 1.5, delay: 0.25, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.loginAlert.alpha = 1.0
        }) { (success) in
            UIView.animate(withDuration: 2, animations: {
                self.loginAlert.alpha = 0.0
            })
            
        }
    }
}
