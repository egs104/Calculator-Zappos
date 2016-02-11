//
//  InterfaceController.swift
//  TipCalculator-Zappos-Watch Extension
//
//  Created by Eric Suarez on 1/27/16.
//  Copyright © 2016 Eric Suarez. All rights reserved.
//

import WatchKit
import Foundation

var currentValue: String = "0"

class InterfaceController: WKInterfaceController {
    
    var calculationExecuted = false

    @IBOutlet var displayLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func numberPressed(value: Int) {
        
        let newValue = "\(value)"
        
        if currentValue == "0" || calculationExecuted {
            calculationExecuted = false
            currentValue = newValue
        } else {
            // append stringvalue of the pressed button to current value
            currentValue += newValue
        }
        
        displayLabel.setText(currentValue)
        
    }

    @IBAction func button1Pressed() {
        numberPressed(1)
    }
    
    @IBAction func button2Pressed() {
        numberPressed(2)
    }
    
    @IBAction func button3Pressed() {
        numberPressed(3)
    }
    
    @IBAction func button4Pressed() {
        numberPressed(4)
    }
    
    @IBAction func button5Pressed() {
        numberPressed(5)
    }
    
    @IBAction func button6Pressed() {
        numberPressed(6)
    }
    
    @IBAction func button7Pressed() {
        numberPressed(7)
    }

    @IBAction func button8Pressed() {
        numberPressed(8)
    }
    
    @IBAction func button9Pressed() {
        numberPressed(9)
    }
    
    @IBAction func button0Pressed() {
        numberPressed(0)
    }
    
    @IBAction func decimalButtonPressed() {
        // check if decimal already exists in value
        // we only want to add it once
        if currentValue.rangeOfString(".") == nil
        {
            currentValue += "."
            displayLabel.setText(currentValue)
        }
    }
    
    @IBAction func clearButtonPressed() {
        currentValue = "0"
        displayLabel.setText(currentValue)
    }
    
}
