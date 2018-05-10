//
//  ViewController.swift
//  DynamicTags
//
//  Created by Radi Shikerov on 10.05.18.
//  Copyright © 2018 Radi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vButtons: ButtonViews!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onAdd(_ sender: Any) {
        vButtons.addButton(text: self.getText())
    }
    @IBAction func onReload(_ sender: Any) {
        
        vButtons.reloadButtons()
    }
    
    func getText() -> String {
        let length = arc4random() % 50
        return randomString(length: Int(length))
    }
   
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}

