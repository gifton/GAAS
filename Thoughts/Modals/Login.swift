//
//  Login.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

struct LoginCredentials {
    let email : String
    let password : String
    init(email : String, password : String) {
        self.email = email
        self.password = password
    }
}

typealias Email = String
typealias Password = String
