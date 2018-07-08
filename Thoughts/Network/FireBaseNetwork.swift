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
            if (error != nil) {
                print("error with auth:\(String(describing: error))")
                emailResult = EmailMessages.noAccount
            } else {
                //if there is an account associated with this email
                if response == nil {
                    emailResult = EmailMessages.noAccount
                    print ("email account could not be validated")
                } else {
                    emailResult = EmailMessages.emailValid
                    print ("account is validated...")
                }
            }
        }
        print ("--------------------------_")
        print (emailResult)
        return emailResult ?? EmailMessages.noAccount
    }

    func login(email : String, password : String) -> Bool {
        var output : Bool!
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if (error != nil) {
                print (LocalizedError.self)
                output = false
            } else {
                output = true
            }
        }
        return output
    }
}


