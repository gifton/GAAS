//
//  SignUpViewController.swift
//  Thoughts
//
//  Created by Dev on 7/4/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = SignUpView(frame: UIScreen.main.bounds)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
