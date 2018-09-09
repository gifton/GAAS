//
//  NewThought.swift
//  Thoughts
//
//  Created by Dev on 7/26/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog

class AddNewThoughtView : UIView, UICollectionViewDelegateFlowLayout{
    override init(frame : CGRect){
        super.init(frame : frame)
        blurBackground(type: UIBlurEffectStyle.extraLight, cornerRadius: 15)
        buildInternalLayout()
    }
    func buildInternalLayout() {
        UIView.animate(withDuration: 0.5, animations: {
            self.addSubview(self.header)
            self.addSubview(self.cancelBtn)
            self.addSubview(self.thoughtTitle)
            self.addSubview(self.thoughtText)
            
            self.cancelBtn.setAnchor(top: nil, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, paddingTop: 0, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0)
            self.header.frame = CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH - 40, height: 70)
            self.header.roundCorners(corners: [.topRight, .topLeft], radius: 15)
            self.header.addSubview(self.headerText)
            self.header.addSubview(self.addThought)
            self.headerText.setAnchor(top: self.header.topAnchor, leading: self.header.leadingAnchor, bottom: self.header.bottomAnchor, trailing: self.header.trailingAnchor, paddingTop: 5, paddingLeading: 15, paddingBottom: 5, paddingTrailing: 95)
            self.addThought.setAnchor(top: self.header.topAnchor, leading: self.headerText.trailingAnchor, bottom: self.header.bottomAnchor, trailing: self.header.trailingAnchor, paddingTop: 5, paddingLeading: 5, paddingBottom: 5, paddingTrailing: 5)
            self.thoughtTitle.setAnchor(top: self.header.bottomAnchor, leading: self.safeLeadingAnchor, bottom: nil, trailing: self.safeTrailingAnchor, paddingTop: 20, paddingLeading: 5, paddingBottom: 0, paddingTrailing: 5)
            self.thoughtText.setAnchor(top: self.thoughtTitle.bottomAnchor, leading: self.leadingAnchor, bottom: self.cancelBtn.topAnchor, trailing: self.trailingAnchor, paddingTop: 10, paddingLeading: 10, paddingBottom: 60, paddingTrailing: 10)
            
            self.cancelBtn.addTarget(self, action: #selector(self.removeAddView(_:)), for: .touchUpInside)
        }) { (true) in
            print("esketi")
        }
        
    }
    
    @objc func removeAddView(_ sender: UIButton){
        self.removeFromSuperview()
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
        btn.backgroundColor = UIColor.darkOverlay
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
    lazy var thoughtTitle : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Dont forget a title!"
        tf.textColor = .white
        tf.addBorders(edges: [.bottom], color: .darkGray)
        return tf
    }()
    lazy var thoughtText : UITextView = {
        let tf = UITextView()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textColor = .darkGray
        tf.backgroundColor = .white
        tf.text = "Whats on ya mind blood?"
        return tf
    }()
    
    let catagoryCollectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .mainOrange
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = true
        return cv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
