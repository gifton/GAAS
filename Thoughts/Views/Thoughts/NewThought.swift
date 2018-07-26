//
//  NewThought.swift
//  Thoughts
//
//  Created by Dev on 7/26/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class NewThought : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBlue
        self.modalPresentationStyle = .popover
        let popover = self.popoverPresentationController!
        popover.delegate = self
        popover.permittedArrowDirections = .up
    }
}
