//
//  ValidationComplete.swift
//  Thoughts
//
//  Created by Dev on 7/11/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

// after validation is complete, display specific either : welcome view, welcome back
protocol validationComplete : class {
    
    func onUserValidated(_ view : UIViewController)
    
}
