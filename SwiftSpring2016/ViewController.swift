//
//  ViewController.swift
//  SwiftSpring2016
//
//  Created by Zhuoli on 4/23/16.
//  Copyright © 2016 ios.zhuoliliang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(sender: UIButton) {
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
    
    @IBAction func performOperation(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle
        {
            if mathematicalSymbol == "π"
            {
                display.text = String(M_PI)
            }
        }
    }

}

