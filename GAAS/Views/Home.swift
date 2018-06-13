//
//  Home.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/9/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit

class HomeView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        layLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //main views : (hello, addition, dashboard)
    
    let helloView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:0.7)
        return view
    }()
    let additionView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let randImage = UIImageView()
    
    fileprivate func layLayout() {
        addSubview(helloView)
        addSubview(additionView)
        addSubview(dashboard)
        
        helloView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height / 5.075))
        additionView.setAnchor(top: helloView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        additionView.heightAnchor.constraint(equalToConstant: 173).isActive =  true
        print(additionView.bounds)
        construction()
    }
    
    fileprivate func construction(){
        additionCV.delegate = self
        additionCV.dataSource = self
        additionCV.register(AdditionCell.self, forCellWithReuseIdentifier: "additionCell")
        additionView.addSubview(additionCV)
        additionCV.setAnchor(top: additionView.topAnchor, leading: additionView.leadingAnchor, bottom: additionView.bottomAnchor, trailing: additionView.trailingAnchor, paddingTop: 2, paddingLeading: 2, paddingBottom: 2, paddingTrailing: 2)
        
        dashboard.delegate = self
        dashboard.dataSource = self
        dashboard.register(DashboardCell.self, forCellReuseIdentifier: "dashboardCell")
        dashboard.setAnchor(top: additionView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
    }
    
    
    let additionCV : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero ,collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = false
        return cv
    }()
    
    let sportsTV : UITableView = {
        let tb = UITableView()
        tb.isPagingEnabled = false
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = true
        tb.allowsSelection = false
        tb.backgroundColor = .mainGray
        tb.layer.cornerRadius = 20
        
        return tb
    }()
    
    let dashboard : UITableView = {
        let tb = UITableView()
        tb.isPagingEnabled = false
        tb.translatesAutoresizingMaskIntoConstraints = false
//        tb.separatorStyle = .singleLine
        tb.showsVerticalScrollIndicator = true
        tb.allowsSelection = false
        tb.backgroundColor = .mainGray
        return tb
    }()
}
