//
//  ExploreTableViewCell.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/3/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import UIKit

class ExploreCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print ("awoke from nib")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        buildCell()
        // Configure the view for the selected state
    }
    
    let card : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainGreenHalf
        view.layer.borderColor = UIColor.mainGrayHalf.cgColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    var title : UILabel = {
        var lbl = UILabel()
        lbl.text = "Savings"
        lbl.font = .boldSystemFont(ofSize: 32)
        lbl.textColor = .darkGray
        return lbl
    }()
    
    func buildCell() {
        print (self.bounds)
        addSubview(card)
        card.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 12.5, paddingLeading: 15, paddingBottom: 12.5, paddingTrailing: 15)
        card.addSubview(title)
        title.frame = CGRect(x: 10, y: 10, width: 150, height: 50)
        
    }

}
