//
//  Warnings.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation

//display messages for users
enum warningMessage : String {
    
    case validPassword = "Please enter a valid password."
    case validPhoneNumber = "Please enter a valid phone number"
    case validName = "Please enter a valid name"
    case validEmailAddress = "Please enter a valid email address."
    case restYourPassword = "An email was sent to you to rest your password"
    case changePassword = "Your password has been changed successfully"
    case logoutMsg = "You've been logged out successfully."
    case network = "please check network connectivity"
    
}

enum AlertMessages : String {
    case loggedIn = "Account\nAuthenticated"
    case notLoggedIn = "Incorrect\nCredentials"
    case accountCreated = "Account\nCreated!"
    case connectionProblem = "Check\nConnection"
    case emailPositive = "positive"
    case emailNegative = "negative"
}

enum EmailMessages {
    case noAccount
    case emailValid
}
