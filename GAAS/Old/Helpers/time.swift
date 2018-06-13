//
//  time.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/6/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func getCurrentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        return hour
    }
}
