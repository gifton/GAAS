//
//  ViewController.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/3/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import UIKit
import SwiftSky
import CoreLocation

class ExploreViewController : UIViewController ,CLLocationManagerDelegate {
    var weather : Double = 0.0
    static var API_KEY = "0e9b8e3d52606fad9bc70e04d38049de"
    
    var locationManager = CLLocationManager()
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error \(error)")
    }
    
    let tableViewCellIdentifier = "tableVIewCell1"
    
    let tableView : UITableView = {
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
        SwiftSky.secret = ExploreViewController.API_KEY
        SwiftSky.hourAmount = .fortyEight
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



