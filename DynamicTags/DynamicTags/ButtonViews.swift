//
//  ButtonViews.swift
//  DynamicTags
//
//  Created by Radi Shikerov on 10.05.18.
//  Copyright © 2018 Radi. All rights reserved.
//

import UIKit

protocol ScrollButtonsDelegate {
    func didPressButton(button: ButtonView)
}

class ButtonViews: UIScrollView {

    private let offset : CGFloat = 10.0;
    private let btnSize : CGFloat = 20.0;
    
    private var titles : [String] = []
    private var buttons : [ButtonView] = []

    func addButton(text: String) {
        var posY = offset
        if let lastBtn = self.buttons.last {
            posY = lastBtn.frame.origin.y + lastBtn.frame.size.height + offset
        }
        
        if let btnView = ButtonView.instanceFromNib() {
            btnView.delegate = self
            btnView.lblTitle.text = text
            let labelSize = btnView.lblTitle.sizeThatFits(self.frame.size);
            
            var btnWidth = labelSize.width + btnSize + 3 * offset
            if btnWidth > self.frame.size.width {
                btnWidth = self.frame.size.width - 5 * offset - btnSize
            }
            
            btnView.frame = CGRect(x: offset,
                                   y: posY,
                                   width: btnWidth,
                                   height: labelSize.height + 2 * offset)
            btnView.roundUp()
            self.titles.append(text)
            self.buttons.append(btnView)
            self.addSubview(btnView)
        }
        
        self.contentSize = CGSize(width: self.contentSize.width, height: posY + 100 + offset )
    }
    
    func reloadButtons() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
        
        var currentTitles = self.titles.map { $0 }
        self.titles.removeAll()
        self.buttons.removeAll()
        
        for title in currentTitles {
            addButton(text: title)
        }
    }

    func removeButton(btn: ButtonView) {
        self.titles = self.titles.filter { $0 != btn.lblTitle.text }
        self.reloadButtons()
    }
}

extension ButtonViews : ScrollButtonsDelegate {
    func didPressButton(button: ButtonView) {
        self.removeButton(btn: button)
    }
}
