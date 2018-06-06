//
//  weather.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/5/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit


enum icons: String {
    
    case clearday = "clearDay"
    case clearnight = "clearNight"
    case rain = "rain"
    case sleet = "sleet"
    case snow = "snow"
    case wind = "windy"
    case fog = "fog"
    case partlycloudyday = "partlyCloudyDay"
    case partlycloudynight = "partlyCloudyNight"
    case cloudy = "cloudy"
    case thunderstorm = "thunderstorm"
    case hail = "hail"
    
}

struct sun {
    var sunrise : String?
    var sunset : String?
    
    init(sunrise : String, sunset : String) {
        self.sunrise = sunrise
        self.sunset = sunset
    }
}
