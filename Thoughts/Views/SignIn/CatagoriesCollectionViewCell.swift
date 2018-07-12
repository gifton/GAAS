//
//  CatagoriesCollectionViewCell.swift
//  Thoughts
//
//  Created by Dev on 7/9/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class CatagoriesCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cell)
        cell.addSubview(view1)
        cell.addSubview(view2)
        
        cell.setAnchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 25, paddingBottom: 50, paddingTrailing: 25)
        NSLayoutConstraint.activate([
            view1.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10),
            view1.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10)
        ])
        view2.setAnchor(top: cell.topAnchor, leading: view1.trailingAnchor, bottom: cell.bottomAnchor, trailing: cell.trailingAnchor, paddingTop: 25, paddingLeading: 25, paddingBottom: 25, paddingTrailing: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cell : UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = true
        
        return view
    }()
    
    let view1 : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.makeCircle(size: 50)
        return view
    }()
    let view2 : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}
