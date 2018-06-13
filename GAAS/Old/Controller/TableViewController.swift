//
//  TableViewController.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/6/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit


extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier, for: indexPath) as! ExploreCell
        cell.backgroundColor = .mainGray
        
        switch indexPath.row {
        case 0:
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: (CellHeight.medium.rawValue - CellSpacing.top.rawValue - CellSpacing.bottom.rawValue))
            layer.colors = [UIColor.mainPurpleHalf.cgColor, UIColor.mainBlueHalf.cgColor]
            layer.cornerRadius = 20
            cell.card.layer.insertSublayer(layer, at: 0)
            cell.title.text = "Time"
        case 1:
            cell.title.text = "Weather"
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height: 350)
            layer.colors = [UIColor.gradientOrangeLight.cgColor, UIColor.gradientOrangeDark.cgColor]
            layer.cornerRadius = 20
            cell.card.layer.insertSublayer(layer, at: 0)
        default:
            cell.title.text = "Something went wrong"
        }
        
        if cell.title.text == "Time" {
            cell.mainCardView = TimeView(frame: .zero)
        } else if cell.title.text == "Weather" {
            cell.mainCardView = WeatherView(frame: .zero)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CellHeight.medium.rawValue
        } else {
            return CellHeight.long.rawValue
        }
    }
}














