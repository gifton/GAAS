//
//  TimeModal.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

struct TimeModal {
    var day : Int
    var month : Int
    var year : Int
    func buildTime(_ times : TimeModal, fontSize : Int = 25, highlightColor : UIColor = .mainYellow) -> UIStackView {
        let monthLbl : UILabel = {
            let lbl = UILabel()
            lbl.text = "\(self.month)"
            lbl.textColor = highlightColor
            lbl.backgroundColor = .clear
            
            return lbl
        }()
        let dayYearlbl : UILabel = {
            let lbl = UILabel()
            lbl.text = " | \(times.day) | \(times.year)"
            lbl.textColor = .white
            lbl.backgroundColor = .clear
            
            return lbl
        }()
        let stackView = UIStackView(arrangedSubviews: [monthLbl, dayYearlbl])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    
}
