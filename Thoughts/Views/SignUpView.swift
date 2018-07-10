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
        addVerticalGradientLayer(topColor: .darkGray, bottomColor: .black)
    }
    //COMPONENTS
    //general
    var loginAlert : UIView!
    
    let icon : UIImageView = {
        let img = UIImageView()
        img.setHeightWidth(width: 70, height: 70)
        img.image = #imageLiteral(resourceName: "icon")
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    //sign in
    let emailField : UITextField = {
        let tv = UITextField()
        let paddingEmail = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.backgroundColor = .clear
        tv.layer.cornerRadius = 3
        tv.addBorders(edges: [.all], color: .offWhite)
        tv.setHeightWidth(width: UIScreen.main.bounds.width - 20, height: 50)
        tv.attributedPlaceholder = NSAttributedString(string: "Email",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.textColor = .offWhite
        tv.leftView = paddingEmail
        tv.leftViewMode = .always
        
        return tv
    }()
    let passwordField : UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .clear
        tv.textColor = .offWhite
        tv.layer.cornerRadius = 5
        tv.setHeightWidth(width: UIScreen.main.bounds.width - 20, height: 50)
        tv.attributedPlaceholder = NSAttributedString(string: "Password",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.addBorders(edges: [.all], color: .offWhite)
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
        btn.layer.cornerRadius = 5
        btn.setTitle("Get started", for: UIControlState())
        btn.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20).isActive = true
        btn.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        return btn
    }()
    let stackView = UIStackView()
    //signUp
    let catagoriesCellID : String = "CatagoriesCellIDMain"
    let catagoriesCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero ,collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.setHeightWidth(width: ScreenSize.SCREEN_WIDTH, height: 50)
        return view
    }()
    let addCatagoriesButton : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .mainOrange
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 2
        btn.setTitle("+", for: UIControlState())
        return btn
    }()
    let catagoryField : UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.attributedPlaceholder = NSAttributedString(string: "Add some catagories you want to track!",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.addBorders(edges: [.bottom], color: .offWhite)
        let padding = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.leftViewMode = .always
        tv.leftView = padding
        
        return tv
    }()
    
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
            icon.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            loginAlert.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginAlert.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 25),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
