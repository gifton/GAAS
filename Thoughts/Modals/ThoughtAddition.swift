//
//  ThoughtAddition.swift
//  Thoughts
//
//  Created by Dev on 7/22/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

//push addition vc
protocol addNewThought : class {
    
    func addThought(_ view : UIViewController)
    func addTodo()
}
