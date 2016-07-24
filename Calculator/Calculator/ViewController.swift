//
//  ViewController.swift
//  Calculator
//
//  Created by Jakub Gac on 22.07.2016.
//  Copyright © 2016 Jakub Gac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var isUserInTheMiddleOfTyping = false
    
    @IBAction private func digit(sender: UIButton) {
        let number = sender.currentTitle!
        if isUserInTheMiddleOfTyping {
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + number
        } else {
            display.text = number
            isUserInTheMiddleOfTyping = true
        }
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        
        if isUserInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            isUserInTheMiddleOfTyping = false
        }

        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
}

