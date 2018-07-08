//
//  AlertView.swift
//  Thoughts
//
//  Created by Dev on 7/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class AlertView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .mainOrange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func alertText (_ alert: String) -> UIView {
        let mainView = UIView()
        return mainView
    }
    func buildView() {
        let view = alertText("Gifton")
        addSubview(view)
        view.frame = self.frame
        
    }
}
