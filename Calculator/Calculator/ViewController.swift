//
//  ViewController.swift
//  Calculator
//
//  Created by Jakub Gac on 22.07.2016.
//  Copyright © 2016 Jakub Gac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var isUserInTheMiddleOfTyping: Bool = false
    
    @IBAction func digit(sender: UIButton) {
        let number = sender.currentTitle!
        if isUserInTheMiddleOfTyping {
            display.text = display.text! + number
        } else {
            display.text = number
            isUserInTheMiddleOfTyping = true
        }
    }
}

