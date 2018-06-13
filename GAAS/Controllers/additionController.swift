//
//  additionController.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/10/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit

extension HomeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163, height: 163)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "additionCell", for: indexPath) as! AdditionCell
        cell.layer.cornerRadius = 8
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "add2"))
            cell.title.text = Additions.goal.rawValue
        case 1:
            cell.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "add3"))
            cell.title.text = Additions.todo.rawValue
        case 2:
            cell.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "add1"))
            cell.title.text = Additions.spending.rawValue
        case 3:
            cell.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "add4"))
            cell.title.text = Additions.random.rawValue
        default:
            break
        }
        return cell
    }
    
}
