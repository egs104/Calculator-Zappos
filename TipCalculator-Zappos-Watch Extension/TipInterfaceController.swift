//
//  TipInterfaceController.swift
//  TipCalculator-Zappos
//
//  Created by Eric Suarez on 2/11/16.
//  Copyright © 2016 Eric Suarez. All rights reserved.
//

import WatchKit
import Foundation


class TipInterfaceController: WKInterfaceController {
    
    var tipDouble = Double()
    var totalDouble = Double()
    var perPersonDouble = Double()
    var totalPeople = Double()
    
    @IBOutlet var percentLabel: WKInterfaceLabel!
    @IBOutlet var tipLabel: WKInterfaceLabel!
    @IBOutlet var totalLabel: WKInterfaceLabel!
    @IBOutlet var perPersonLabel: WKInterfaceLabel!
    @IBOutlet var peopleLabel: WKInterfaceLabel!
    @IBOutlet var tipPercentSlider: WKInterfaceSlider!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        tipDouble = Double(currentValue)! * 0.15
        totalDouble = Double(currentValue)! + tipDouble
        perPersonDouble = totalDouble / totalPeople
        
        percentLabel.setText("15%")
        
        tipPercentSlider.setValue(15)
        
        tipLabel.setText(String(format: "$%.2f", tipDouble))
        
        totalLabel.setText(String(format: "$%.2f", totalDouble))
        
        perPersonLabel.setText(String(format: "$%.2f", perPersonDouble))
        
    }
    
    @IBAction func tipSliderDidChange(value: Double) {
        
        percentLabel.setText("\(Int(value))%")
        
        tipDouble = Double(currentValue)! * (value/100)
        totalDouble = Double(currentValue)! + tipDouble
        
        tipLabel.setText(String(format: "$%.2f", tipDouble))
        
        totalLabel.setText(String(format: "$%.2f", totalDouble))
        
        perPersonDouble = totalDouble / totalPeople
        
        perPersonLabel.setText(String(format: "$%.2f", perPersonDouble))
        
    }
    
    @IBAction func peopleSliderDidChange(value: Double) {
        
        peopleLabel.setText("\(Int(value)) People")
        
        totalPeople = value
        
        perPersonDouble = totalDouble / value
        
        perPersonLabel.setText(String(format: "$%.2f", perPersonDouble))
        
    }
    

}