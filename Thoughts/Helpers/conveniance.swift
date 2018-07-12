//
//  conveniance.swift
//  Thoughts
//
//  Created by Dev on 7/2/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func getDate() -> TimeModal {
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let output = TimeModal(day: day, month: month, year: year)
        return output
    }
}

extension UIButton {
    func disableButton(_ button: UIButton) {
        button.layer.opacity = 0.4
        button.isEnabled = false
    }
}

/*
 func buttonAction3() {
         self.performSegue(withIdentifier: "segueToNext", sender: self)
     }
 
     override func prepare(for segue: SignUpViewController, sender: Any?) {
         if segue.identifier == "segueToNext" {
             if let destination = segue.destination as? SignUpViewController {
                 destination.nomb = nombres // you can pass value to destination view controller
             }
         }
     }
 }
 extension UIView {
 func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
 let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
 rotateAnimation.fromValue = 0.0
 rotateAnimation.toValue = CGFloat(Double.pi)
 rotateAnimation.duration = duration
 
 if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
 rotateAnimation.delegate = delegate
 }
 self.layer.add(rotateAnimation, forKey: nil)
 }
*/
