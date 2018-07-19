//
//  WelcomeUser.swift
//  Thoughts
//
//  Created by Dev on 7/11/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class WelcomeBackView : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "welcome back Gifton"
        self.navigationItem.title = "welcome back Gifton"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .mainGreen
        
        view.addSubview(welcomeLabel)
        view.addSubview(welcomePhoto)
        
        welcomeLabel.frame = CGRect(x: 10, y: 50, width: ScreenSize.SCREEN_WIDTH - 20, height: 200)
        NSLayoutConstraint.activate([
            welcomePhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomePhoto.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    let welcomeLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome Back, gifton"
        lbl.font = .boldSystemFont(ofSize: 25)
        lbl.textColor = .mainBlue

        return lbl
    }()
    let welcomePhoto : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "welcome")
        iv.setHeightWidth(width: 200, height: 200)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
}
