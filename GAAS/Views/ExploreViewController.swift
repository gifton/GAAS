//
//  ViewController.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/3/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import UIKit

class ExploreViewController : UIViewController {
    
    
    
    let tableViewCellIdentifier = "tableVIewCell1"
    
    let tableView : UITableView = {
        let tb = UITableView()
        tb.isPagingEnabled = false
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorStyle = .none
        tb.showsVerticalScrollIndicator = false
        tb.backgroundColor = .offWhite
        
        return tb
    }()
    
    var welcomeLabel : UILabel = {
        var lbl = UILabel()
        lbl.text = "Savings"
        lbl.font = .boldSystemFont(ofSize: 32)
        lbl.textColor = .darkGray
        
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .mainGray
        setupTableView()
        welcome()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func welcome() {
        view.addSubview(welcomeLabel)
        welcomeLabel.frame = CGRect(x: 15, y: 20, width: UIScreen.main.bounds.width - 50, height: 40)
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
            cell.mainCardView = TimeView(frame: .zero)
            cell.card.backgroundColor = .darkGray
            cell.title.text = "Time"
        case 1:
            cell.title.text = "Weather"
            cell.card.backgroundColor = UIColor.mainOrange
        case 2:
            cell.title.text = "Tasks"
            cell.card.backgroundColor = UIColor.mainYellow
        case 3:
            cell.title.text = "Savings"
            cell.card.backgroundColor = UIColor.mainGreen
        default:
            cell.title.text = "Something went wrong"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

