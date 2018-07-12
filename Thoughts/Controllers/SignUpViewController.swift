//
//  SignUpViewController.swift
//  Thoughts
//
//  Created by Dev on 7/4/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController : UIViewController, validationComplete {
    
    func pushWelcomeVC(_ vc : UIViewController) {
        print("working...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = SignUpView(frame: UIScreen.main.bounds)
        
        self.navigationController?.isNavigationBarHidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func testFunc() {
        print ("test func worked!")
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
