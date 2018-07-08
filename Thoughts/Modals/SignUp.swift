//
//  SignUp.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation


struct SignUpCredentials {
    let email : String
    let password : String
    let catagories : [String]
    init(email : String, password : String, catagories : [String]) {
        self.email = email
        self.password = password
        self.catagories = catagories
    }
}
