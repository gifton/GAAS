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
        
        if selected == true {
            print ("selected")
        }
        
        
        // Configure the view for the selected state
    }
    
    var card : UIView = {
        let view = UIView()
        
        view.layer.borderColor = UIColor.mainGray.cgColor
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var mainCardView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        return view
    }()
    
    var title : UILabel = {
        var lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 32)
        lbl.textColor = .white
        return lbl
    }()
    
    func buildCell() {
        
        addSubview(card)
//        card.setCellShadow()
        card.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 12.5, paddingLeading: 15, paddingBottom: 12.5, paddingTrailing: 15)
        card.addSubview(title)
        title.frame = CGRect(x: 10, y: 10, width: 150, height: 50)
        
        //variable View
        card.addSubview(mainCardView)
        mainCardView.setAnchor(top: title.bottomAnchor, leading: card.leadingAnchor, bottom: card.bottomAnchor, trailing: card.trailingAnchor, paddingTop: -5, paddingLeading: 0, paddingBottom: 5, paddingTrailing: 5)
        
        //background blur
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = card.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        card.insertSubview(blurEffectView, at: 1)
        
        
    }
}
