//
//  AlertView.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class AlertView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.blurBackground(type: .extraLight)
        self.layer.cornerRadius = 6
        translatesAutoresizingMaskIntoConstraints = false
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let alertText : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .offWhite
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "I fucking hate busses"
        lbl.adjustsFontSizeToFitWidth =  true
        return lbl
    }()
    
    let alertImage : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "toDo")
        img.setHeightWidth(width: 40, height: 40)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    func buildView() {
        addSubview(alertText)
        addSubview(alertImage)
        NSLayoutConstraint.activate([
            alertText.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertText.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            alertText.heightAnchor.constraint(equalToConstant: 30),
            alertText.widthAnchor.constraint(equalToConstant: 165),
            alertImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
