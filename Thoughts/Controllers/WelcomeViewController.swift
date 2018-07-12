//
//  WelcomeViewController.swift
//  Thoughts
//
//  Created by Dev on 7/11/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func pushToWelcome(_ view : UIViewController) {
        self.navigationController?.pushViewController(view, animated: true)
    }

}
