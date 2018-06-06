//
//  ViewController.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/3/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import UIKit

class ExploreViewController : UIViewController {
    var weather : Double = 0.0
    static var API_KEY = "0e9b8e3d52606fad9bc70e04d38049de"
    
    let tableViewCellIdentifier = "tableVIewCell1"
    
    let tableView : UITableView = {
        let tb = UITableView()
        tb.isPagingEnabled = false
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.allowsSelection = false
        tb.backgroundColor = .mainGray
        tb.layer.cornerRadius = 20
        
        return tb
    }()
    
    var welcomeLabel : UILabel = {
        var lbl = UILabel()
        lbl.text = "Savings"
        lbl.font = .boldSystemFont(ofSize: 25)
        lbl.textColor = .darkGray
        lbl.addBorders(edges: [.bottom], color: .darkGray, thickness: 3)
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setupTableView()
        welcome()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func welcome() {
        view.addSubview(welcomeLabel)
        welcomeLabel.frame = CGRect(x: 15, y: 30, width: UIScreen.main.bounds.width - 50, height: 40)
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour <= 11 {
            welcomeLabel.text = "Good Morning, Gifton"
        } else if hour <= 18 {
            welcomeLabel.text = "Good afternoon, Gifton"
        } else if hour <= 24 {
            welcomeLabel.text =  "Good evening, Gifton"
        }
    }
    
    func setupTableView() {
        
        tableView.register(ExploreCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.setAnchor(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: view.safeBottomAnchor, trailing: view.trailingAnchor, paddingTop: 50, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
    }
}

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



