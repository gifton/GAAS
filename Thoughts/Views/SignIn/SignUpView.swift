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
//import FirebaseAuth
import NVActivityIndicatorView

class SignUpView : UIView {
    var delegate: validationComplete?
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildSkeleton()
        addVerticalGradientLayer(topColor: .darkGray, bottomColor: .black)
    }
    //COMPONENTS
    let activityIndicator = NVActivityIndicatorView(frame: CGRect(x: (ScreenSize.SCREEN_WIDTH - 45) / 2, y: (ScreenSize.SCREEN_HEIGHT - 45) / 2, width: 45, height: 45), type: .ballScaleMultiple, color: .white, padding: 10)
    //general
    let icon : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "icon")
        img.contentMode = .scaleAspectFit
        return img
    }()
    //sign in
    let emailField : UITextField = {
        let tv = UITextField()
        let paddingEmail = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.backgroundColor = .clear
        tv.layer.cornerRadius = 3
        tv.addBorders(edges: [.all], color: .offWhite)
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
        btn.isSpringLoaded = true
        btn.setTitle("Get started", for: UIControlState())
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
    let welcomeLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = .boldSystemFont(ofSize: 22)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .gray
        return lbl
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
        btn.blurBackground(type: UIBlurEffectStyle.dark, cornerRadius: 0)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 2
        btn.setTitle("+", for: UIControlState())
        return btn
    }()
    let nameField : UITextField = {
        let tv = UITextField()
        let paddingEmail = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.backgroundColor = .clear
        tv.layer.cornerRadius = 3
        tv.addBorders(edges: [.all], color: .offWhite)
        tv.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        tv.textColor = .offWhite
        tv.leftView = paddingEmail
        tv.leftViewMode = .always
        tv.translatesAutoresizingMaskIntoConstraints = false
        
        return tv
    }()
    let catagoryField : UITextField = {
        let tv = UITextField()
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.attributedPlaceholder = NSAttributedString(string: "Add some catagories you want to track!",
                                                      attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
        tv.addBorders(edges: [.bottom], color: .black)
        let padding = UIView.init(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        tv.leftViewMode = .always
        tv.leftView = padding
        
        return tv
    }()
    
    fileprivate func buildSkeleton() {
        
        addSubview(activityIndicator)
        
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        stackView.addArrangedSubview(signInButton)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        self.addSubview(stackView)
        self.addSubview(icon)
        self.addSubview(welcomeLabel)
        
        welcomeLabel.frame = CGRect(x: 100, y: (ScreenSize.SCREEN_WIDTH / 10) + 10, width: 220, height: 50)
        welcomeLabel.center.x += 200
        stackView.frame = CGRect(x: 10, y: 150, width: UIScreen.main.bounds.width - 20, height: 180)
        icon.frame = CGRect(x: (ScreenSize.SCREEN_WIDTH - 70) / 2, y: 40, width: 70, height: 70)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
