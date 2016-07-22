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
    
    var isUserInTheMiddleOfTyping = false
    
    @IBAction func digit(sender: UIButton) {
        let number = sender.currentTitle!
        if isUserInTheMiddleOfTyping {
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + number
        } else {
            display.text = number
            isUserInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func performOperation(sender: UIButton) {
        isUserInTheMiddleOfTyping = false
        if let mathematicalOperation = sender.currentTitle {
            if mathematicalOperation == "pi"{
                display.text = String(M_PI)
            }
        }
    }
    
}

