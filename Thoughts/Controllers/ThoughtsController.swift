//
//  ThoughtsController.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class ThoughtsController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view = ThoughtsView(frame: UIScreen.main.bounds)
        
    }
}

extension ThoughtsView {
    @objc func action(_ sender: UIButton) {
        add.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: -5, right: 5)
        self.addSubview(AddNewThoughtView(frame: CGRect(x: 20, y: 50, width: ScreenSize.SCREEN_WIDTH - 40 , height: ScreenSize.SCREEN_HEIGHT - 100)))
        
        print("fwk")
    }
}
