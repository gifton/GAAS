//
//  NewThought.swift
//  Thoughts
//
//  Created by Dev on 7/26/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit

class AddNewThoughtView : UIView {
    override init(frame : CGRect){
        super.init(frame : frame)
        blurBackground(type: UIBlurEffectStyle.extraLight, cornerRadius: 15)
        addSubview(header)
        addSubview(cancelBtn)
        addSubview(thoughtTitle)
        cancelBtn.setAnchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
        header.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH - 40, height: 70)
        header.roundCorners(corners: [.topRight, .topLeft], radius: 15)
//        cancelBtn.roundCorners(corners: [.bottomRight, .bottomRight], radius: 15)
        header.addSubview(headerText)
        header.addSubview(addThought)
        headerText.setAnchor(top: header.topAnchor, leading: header.leadingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, paddingTop: 5, paddingLeading: 15, paddingBottom: 5, paddingTrailing: 95)
        addThought.setAnchor(top: header.topAnchor, leading: headerText.trailingAnchor, bottom: header.bottomAnchor, trailing: header.trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 5, paddingTrailing: 5)
        thoughtTitle.setAnchor(top: header.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, paddingTop: 20, paddingLeading: 5, paddingBottom: 0, paddingTrailing: 5)
    }
    let header : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainBlue
        return view
    }()
    let headerText : EdgeInsetLabel = {
        let lbl = EdgeInsetLabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Add a thought 🌚"
        lbl.addBorders(edges: [.right], color: .darkOverlay)
        lbl.rightTextInset = 10
        return lbl
    }()
    let addThought : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.mainOrange
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 2
        btn.setTitle("add", for: UIControlState())
        return btn
    }()
    let cancelBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Cancel", for: .normal)
        btn.backgroundColor = UIColor(red:1.00, green:0.23, blue:0.19, alpha:1.0)
        return btn
    }()
    let thoughtTitle : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Dont forget a title!"
        tf.textColor = .white
        tf.addBorders(edges: [.bottom], color: .mainGreen)
        return tf
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
