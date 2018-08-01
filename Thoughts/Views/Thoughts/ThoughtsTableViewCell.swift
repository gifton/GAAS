//
//  ToDoTableViewCell.swift
//  Thoughts
//
//  Created by Dev on 7/4/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class ThoughtsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    let cell : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.52)
        view.layer.cornerRadius = 5
        return view
    }()
    let cellHeader : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainGrayHalf.withAlphaComponent(0.4)
        return view
    }()
    let icon : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.setHeightWidth(width: 40, height: 40)
        return iv
    }()
    let title : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let topic : EdgeInsetLabel = {
        let lbl = EdgeInsetLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.addBorders(edges: [.left], color: .darkOverlay)
        lbl.leftTextInset = 10
        return lbl
    }()
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let dateLabel = getDate()
        let date = dateLabel.buildTime(dateLabel, fontSize: 22, highlightColor: .mainBlue)
        backgroundColor = .mutedBlue
        addSubview(cell)
        cell.frame = CGRect(x: 10, y: 10, width: UIScreen.main.bounds.width - 20, height: 120)
        cell.addSubview(date)
        cell.addSubview(title)
        cell.addSubview(cellHeader)
        
        cellHeader.addSubview(icon)
        cellHeader.addSubview(topic)
        
        cellHeader.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 20, height: 40)
        icon.setAnchor(top: cellHeader.topAnchor, leading: cellHeader.leadingAnchor, bottom: cellHeader.bottomAnchor, trailing: nil, paddingTop: 0, paddingLeading: 5, paddingBottom: 0, paddingTrailing: 0)
        topic.setAnchor(top: cellHeader.topAnchor, leading: icon.trailingAnchor, bottom: cellHeader.bottomAnchor, trailing: cellHeader.trailingAnchor, paddingTop: 2, paddingLeading: 10, paddingBottom: 2, paddingTrailing: 10)
        title.setAnchor(top: cellHeader.bottomAnchor, leading: cell.leadingAnchor, bottom: cell.bottomAnchor, trailing: cell.trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 25, paddingTrailing: 5)
        date.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -5).isActive = true
        date.topAnchor.constraint(equalTo : title.bottomAnchor).isActive = true
        date.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        cellHeader.roundCorners(corners: [.topRight, .topLeft], radius: 5)
    }
    
}
