//
//  SignUpLogic.swift
//  Thoughts
//
//  Created by Dev on 7/9/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension SignUpView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: catagoriesCellID, for: indexPath)
        cell.backgroundColor = .offWhite
        return cell
    }
    
    //build collectionView
    @objc func userDoesNotHaveAccount() {
        
        
        catagoriesCV.delegate = self
        catagoriesCV.dataSource = self
        
        self.addVerticalGradientLayer(topColor: .darkGray, bottomColor: .black)
        
        UIView.animate(withDuration: 2, delay: 0.5, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.backgroundColor = .black
        }) { (true) in
            self.stackView.removeFromSuperview()
            self.addSubview(self.lineView)
            self.addSubview(self.searchBar)
            
            NSLayoutConstraint.activate([
                self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: ScreenSize.SCREEN_HEIGHT / 1.75),
                self.searchBar.bottomAnchor.constraint(equalTo: self.lineView.topAnchor, constant: 0),
                self.searchBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                self.searchBar.widthAnchor.constraint(equalToConstant: ScreenSize.SCREEN_WIDTH)
            ])
        }
        
        
    }
    
    @objc func displayAccountView(view : UIView) {
        
    }
    @objc func didTapGetStarted(_ sender: UIButton) {
        print("Button clicked")
        sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
        
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: CGFloat(0.10), initialSpringVelocity: CGFloat(2.0),                     options: UIViewAnimationOptions.allowUserInteraction, animations: {
            sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in() }
        )
        switch passwordField.isHidden {
            
        case true:
            Auth.auth().fetchProviders(forEmail: emailField.text!) { (response, error) in
                //if there is an issue with calling firebase....
                if (error != nil) {
                    print("error with auth:\(String(describing: error))")
                    self.displayAlert(self.signInButton)
                } else {
                    //if there is an account associated with this email
                    if response == nil {
                        print ("email account could not be validated")
                        self.displayAlert(self.signInButton)
                        self.userDoesNotHaveAccount()
                    } else {
                        print ("account is validated...")
                        self.passwordField.isHidden = false
                        self.signInButton.setTitle("Log in", for: .normal)
                    }
                }
            }
            
        case false:
            Auth.auth().signIn(withEmail: self.emailField.text!, password: passwordField.text!) { (result, error) in
                if (error != nil) {
                    print (error?.localizedDescription as Any)
                } else {
                    print ("logged in")
                }
            }
        }
    }
    @objc func displayAlert(_ button : UIButton) {
        UIView.animate(withDuration: 1.5, delay: 0.25, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.loginAlert.alpha = 1.0
        }) { (success) in
            UIView.animate(withDuration: 2, animations: {
                self.loginAlert.alpha = 0.0
            })
            
        }
    }
}
