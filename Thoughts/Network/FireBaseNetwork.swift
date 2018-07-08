//
//  FireBaseNetwork.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

extension UIView {
    func userHasAccount(email : String) -> EmailMessages {
        var emailResult : EmailMessages!
        Auth.auth().fetchProviders(forEmail: email) { (response, error) in
            //if there is an issue with calling firebase....
            print ("response : \(type(of:response))")
            if (error == nil) {
                print("error with auth:\(String(describing: error))")
                emailResult = EmailMessages.noAccount
            } else {
                //if there is an account associated with this email
                if response == nil {
                    emailResult = EmailMessages.noAccount
                    print ("email account could not be validated")
                } else {
                    emailResult = EmailMessages.emailValid
                    print ("acocunt is validated...")
                }
            }
        }
        return emailResult ?? EmailMessages.noAccount
    }
}

public func login(email : String, password : String) {
    
}