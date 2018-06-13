//
//  AdditionCell.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/10/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit

class AdditionCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 6
        backgroundColor = .mainOrange
        addSubview(title)
        title.frame = CGRect(x: 10, y: 10, width: frame.width, height: 30)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var title : UILabel = {
        var lbl = UILabel()
        lbl.text = "Gifton"
        lbl.font = .boldSystemFont(ofSize: 28)
        lbl.setCellShadow()
        lbl.textColor = .white
        return lbl
    }()
}
