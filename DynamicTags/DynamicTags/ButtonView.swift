//
//  ButtonView.swift
//  DynamicTags
//
//  Created by Radi Shikerov on 10.05.18.
//  Copyright © 2018 Radi. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    
    var delegate : ScrollButtonsDelegate?
    
    class func getNibName() -> String {
        return self.description().components(separatedBy: ".").last!
    }
    
    class func instanceFromNib() -> ButtonView? {
        let nib = UINib(nibName: ButtonView.getNibName(), bundle: nil)
        let buttonView = nib.instantiate(withOwner: nil, options: nil)[0] as? ButtonView
        return buttonView
    }
    
//    class func instanceFromNib() -> ButtonView? {
//        return UINib(nibName: ButtonView.getNibName(),
//                     bundle: nil).instantiate(withOwner: nil,
//                                              options: nil)[0] as? ButtonView
//    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func roundUp() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    func setupAppearance() {
        self.backgroundColor = UIColor.purple
        self.lblTitle.textColor = UIColor.white
        self.btnDelete.titleLabel?.textColor = UIColor.white
    }
    
    @IBAction func onDelete(_ sender: Any) {
        if let delegate = self.delegate {
            delegate.didPressButton(button: self)
        }
    }
}


