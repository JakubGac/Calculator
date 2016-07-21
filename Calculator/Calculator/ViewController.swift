//
//  ViewController.swift
//  Calculator
//
//  Created by Jakub Gac on 21.07.2016.
//  Copyright © 2016 Jakub Gac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false
    
    @IBAction func appear(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
}

