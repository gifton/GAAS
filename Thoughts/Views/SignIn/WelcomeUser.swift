//
//  WelcomeUser.swift
//  Thoughts
//
//  Created by Dev on 7/11/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class WelcomeUserView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainOrange
        addSubview(welcomeLabel)
        addSubview(welcomePhoto)
        welcomeLabel.frame = CGRect(x: 10, y: 50, width: ScreenSize.SCREEN_WIDTH - 20, height: 200)
        NSLayoutConstraint.activate([
            welcomePhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomePhoto.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let welcomeLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome to GAAS"
        lbl.font = .boldSystemFont(ofSize: 44)
        
        return lbl
    }()
    let welcomePhoto : UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "welcome")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
}
