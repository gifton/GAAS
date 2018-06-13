//
//  weather.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/5/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit
import SwiftSky

extension UIImageView {
    func downloadedFrom(imgString: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        let url = URL(string: imgString)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
    
extension WeatherView {
    func getWeather() {
        
        SwiftSky.get([.current, .minutes, .hours, .days, .alerts],
                     at: Location(latitude: 47.8280918, longitude: 122.2630829)) { result in
                        switch result {
                        case .success(let forecast):
                            
                            //define variables
                            let temp = (forecast.current?.temperature?.current?.value)!
                            let description = (forecast.days?.summary)!
                            let weatherIcon = ((forecast.current?.icon)!).replacingOccurrences(of: "-", with: "")
                            let precipitationProbability = (forecast.current?.precipitation?.probability)!
                            let precipitation = (forecast.current?.precipitation?.type)!
                            let sunsetTime = (forecast.current?.sunset)
                            
                            //send to views
                            self.currentTempLabel.text = String(temp) + "°"
                            self.currentWeatherDescription.text = description
                            self.currentTempIcon.image = UIImage(named: weatherIcon)
                            self.currentSunsetLabel.text = "\(sunsetTime)"
                            
                            //logic for precipitation
                            if String((precipitation).rawValue) != "rain" {
                                
                                let currentTime = self.getCurrentHour()
                                
                                if currentTime >= 21 {
                                    self.precipitationIcon.image = #imageLiteral(resourceName: "clearnight")
                                } else {
                                    self.precipitationIcon.image = #imageLiteral(resourceName: "clearday")
                                }
                                self.precipitationLabel.text = "Nahh fam"
                                
                                
                            } else {
                                
                                self.precipitationIcon.image = #imageLiteral(resourceName: "rain")
                                self.precipitationLabel.text = "\(precipitationProbability.label) chance of \(precipitation)"
                            }

                            
                        case .failure(let error):
                            print(error)
                        }
                        
                        
        }
    }
}

