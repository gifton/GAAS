//
//  FireBaseNetwork.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import NVActivityIndicatorView

//login logic
//  if user has account, display password field
//  if user doesnt have account, display signup components
//  if email invalid / poor connection : display alert
extension SignUpView {
    
    @objc func didTapGetStarted(_ sender: UIButton) {
        print("Button clicked")
        
//        sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        self.signInButton.setTitleColor(.black, for: .normal)
        
        switch passwordField.isHidden {
            case true:
                self.activityIndicator.startAnimating()
                Auth.auth().fetchProviders(forEmail: emailField.text!) { (response, error) in
                    //if there is an issue with calling firebase....
                    if (error != nil) {
                        print("error with auth:\(String(describing: error))")
                        self.userDoesNotHaveAccount()
                        self.activityIndicator.stopAnimating()
                    } else {
                        //if there is an account associated with this email
                        if response == nil {
                            print ("email account could not be validated")
                            self.activityIndicator.stopAnimating()
                            self.userDoesNotHaveAccount()
                        } else {
                            print ("account is validated...")
                            self.passwordField.isHidden = false
                            self.signInButton.setTitle("Log in", for: .normal)
                            self.activityIndicator.stopAnimating()
                        }
                    }
                }
            
            case false:
                if self.icon.image == #imageLiteral(resourceName: "icon") {
                    activityIndicator.startAnimating()
                    Auth.auth().signIn(withEmail: self.emailField.text!, password: passwordField.text!) { (result, error) in
                        if (error != nil) {
                            print (error?.localizedDescription as Any)
                            self.activityIndicator.stopAnimating()
                        } else {
                            print ("logged in")
                            self.activityIndicator.stopAnimating()
                        }
                    }
                } else {
                    Auth.auth().createUser(withEmail: self.emailField.text!, password: self.passwordField.text!) { (result, error) in
                        if (error != nil) {
                            print (error?.localizedDescription as Any)
                            self.activityIndicator.stopAnimating()
                        } else {
                            print ("User created")
                            self.activityIndicator.stopAnimating()
                        }
                    }
                    self.createUser()
                }
            
        }
    }
}

