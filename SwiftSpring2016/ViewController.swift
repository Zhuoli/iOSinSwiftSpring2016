//
//  ViewController.swift
//  SwiftSpring2016
//
//  Created by Zhuoli on 4/23/16.
//  Copyright © 2016 ios.zhuoliliang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBOutlet private weak var display: UILabel!
    
    private var displayValue : Double
    {
        get{
            return Double(display.text!)!
        }
        set
        {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping
        {
            let textCurrentluyInDisplay = display.text!
            display!.text = textCurrentluyInDisplay+digit
        
        }else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
        print("touched \(digit) digit")
        
    }
    
    private var brain = CalculatorBrain()
    @IBAction private func performOperation(sender: UIButton) {

        if userIsInTheMiddleOfTyping
        {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle
        {
            brain.performOperatin(mathematicalSymbol)
            displayValue = brain.result
        }
    }

}

