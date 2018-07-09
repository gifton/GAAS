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
        addVerticalGradientLayer(topColor: .wesatBlue, bottomColor: .mainBlue)
    }
    
    let icon : UIImageView = {
        let img = UIImageView()
        img.setHeightWidth(width: 70, height: 70)
        img.image = #imageLiteral(resourceName: "icon")
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.cornerRadius = 3
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
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 2
        btn.layer.cornerRadius = 5
        btn.setTitle("Get started", for: UIControlState())
        btn.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 15).isActive = true
        btn.addTarget(self, action: #selector(didTapGetStarted), for: .touchUpInside)
        return btn
    }()
    let stackView = UIStackView()
    let catagoriesCellID : String = "CatagoriesCellIDMain"
    let catagoriesCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero ,collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = false
        return cv
    }()
    let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.setHeightWidth(width: ScreenSize.SCREEN_WIDTH, height: 3)
        return view
    }()
    
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        sb.barStyle = .blackOpaque
        sb.placeholder = "Add in your catagories"
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()

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
}
