//
//  TableModel.swift
//  GAAS
//
//  Created by Gifton Okoronkwo on 6/6/18.
//  Copyright © 2018 Gifton Okoronkwo. All rights reserved.
//

import Foundation
import UIKit

enum CellHeight: CGFloat {
    case medium = 280.0
    case long = 400.0
}

enum CellSpacing: CGFloat {
    case top = 12.5
    case bottom = 15.0
    
    func total() -> CGFloat {
        let total = (CellSpacing.top.rawValue + CellSpacing.bottom.rawValue)
        print (total)
        return total
    }
}
