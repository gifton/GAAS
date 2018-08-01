//
//  SignUpViewController.swift
//  Thoughts
//
//  Created by Dev on 7/4/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import NVActivityIndicatorView

class SignUpViewController : UIViewController, validationComplete {
    
    func onUserValidated(_ vc : UIViewController) {
        print("working...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = SignUpView(frame: UIScreen.main.bounds)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}


//MARK: SignUP view extenstiob for all external functions


extension SignUpView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if userCatagories.count != 0 {
            return userCatagories.count
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: catagoriesCellID, for: indexPath) as! CatagoriesCollectionViewCell
        cell.backgroundColor = .clear
        
        if userCatagories.count != 0 {
            cell.view2.text = userCatagories[indexPath.row] as? String ?? "Gifton"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.catagoriesCV.frame.width, height: 200)
    }
    
    //build collectionView
    @objc func userDoesNotHaveAccount() {
        print (self.stackView.frame)
        catagoriesCV.delegate = self
        catagoriesCV.dataSource = self
        catagoriesCV.register(CatagoriesCollectionViewCell.self, forCellWithReuseIdentifier: catagoriesCellID)
        self.addVerticalGradientLayer(topColor: .randomRed, bottomColor: .mainGreen)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.icon.frame = CGRect(x: 25, y: ScreenSize.SCREEN_WIDTH / 8, width: 50, height: 50)
            }) { (true) in
                let lineView = self.lineView
                let catagoriesCV = self.catagoriesCV
                let catagoriesField = self.catagoryField
                let addCatagoriesButton = self.addCatagoriesButton
                let signInBtn = self.signInButton
                let stackView = self.stackView
                let welcome = self.welcomeLabel
                
                welcome.center.x -= 200
                welcome.text = "Lets get you signed up!"
                self.icon.image = #imageLiteral(resourceName: "icon-yellow")
                signInBtn.backgroundColor = UIColor(red:1.00, green:0.76, blue:0.44, alpha:1.0)
                signInBtn.layer.cornerRadius = 0
                
                stackView.insertArrangedSubview(self.nameField, at: 0)
                stackView.removeArrangedSubview(self.signInButton)
                
                self.passwordField.isHidden = false
                
                self.nameField.addBorders(edges: .all, color: UIColor(red:1.00, green:0.76, blue:0.44, alpha:1.0))
                self.emailField.addBorders(edges: .all, color: .black)
                self.passwordField.addBorders(edges: .all, color: .black)
                
                self.addSubview(lineView)
                self.addSubview(catagoriesCV)
                self.addSubview(signInBtn)
                lineView.addSubview(catagoriesField)
                lineView.addSubview(addCatagoriesButton)
                
                NSLayoutConstraint.activate([
                    lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    lineView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10),
                    catagoriesField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                    catagoriesField.topAnchor.constraint(equalTo: lineView.topAnchor),
                    catagoriesField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -55),
                    catagoriesField.bottomAnchor.constraint(equalTo: lineView.bottomAnchor)
                    ])
                addCatagoriesButton.setAnchor(top: lineView.topAnchor, leading: catagoriesField.trailingAnchor, bottom: lineView.bottomAnchor, trailing: lineView.trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 5, paddingTrailing: 10)
                catagoriesCV.setAnchor(top: lineView.bottomAnchor, leading: self.leadingAnchor, bottom: self.safeBottomAnchor, trailing: self.trailingAnchor, paddingTop: 5, paddingLeading: 0, paddingBottom: 50, paddingTrailing: 0)
                signInBtn.setAnchor(top: catagoriesCV.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
            }
        })
    }
    
    func createUser() {
        
        self.signInButton.setTitle("", for: .normal)
        self.activityIndicator.startAnimating()
        
        let welcomeView = WelcomeViewController()
        delegate?.onUserValidated(welcomeView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            self.activityIndicator.stopAnimating()
            print("user has been authenticated, and hello view controller displayed")
        }
    }

    func errorWithEmailValidation(_ sender: Any) {}
    
    @objc func onAddCatClick(_ sender : UIButton) {
        self.addCatagoriesButton.backgroundColor = .red
        print ("moved to addition section")
        guard let text = self.catagoryField.text else { return }
        self.userCatagories.append(text)
        catagoriesCV.reloadData()
        
    }
    
}
