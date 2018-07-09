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
        self.blurBackground(type: .dark)
        self.layer.cornerRadius = 6
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func alertText (_ alert: String) -> UILabel {
        let output : UILabel = {
            let lbl = UILabel()
            lbl.textColor = .offWhite
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.text = alert
            lbl.adjustsFontSizeToFitWidth =  true
            return lbl
        }()
        return output
    }
    let alertImage : UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "toDo")
        img.setHeightWidth(width: 40, height: 40)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()
    func buildView() {
        let textUpper = alertText("Please format email")
        addSubview(textUpper)
        addSubview(alertImage)
        NSLayoutConstraint.activate([
            textUpper.centerXAnchor.constraint(equalTo: centerXAnchor),
            textUpper.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textUpper.heightAnchor.constraint(equalToConstant: 30),
            alertImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertImage.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
