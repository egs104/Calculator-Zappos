//
//  ViewController.swift
//  TipCalculator-Zappos
//
//  Created by Eric Suarez on 1/27/16.
//  Copyright © 2016 Eric Suarez. All rights reserved.
//

import UIKit

extension Double {
    func asLocaleCurrency() -> String {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleSlider: UISlider!
    
    var tipPercentage = Double()
    var billAmount = Double()
    var tipAmount = Double()
    var total = Double()
    var people = Double()
    
    let rememberTextEntryTime = NSTimeInterval.init(600) //600 seconds = 10 min

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        billTextField.placeholder = "$0.00"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let defaultValues = ["billFieldText":"0", "lastTipTime":NSDate()]
        
        //"defaultTipPercentage":0.18
        
        defaults.registerDefaults(defaultValues)
        
        defaults.synchronize()
        
        tipSlider.value = Float(defaults.doubleForKey("defaultTipPercentage")*100)
        
        tipPercentageLabel.text = "\(defaults.doubleForKey("defaultTipPercentage")*100)%"
        
        let activeTimeValue = defaults.valueForKey("lastTipTime") as! NSDate
        
        if (activeTimeValue.timeIntervalSinceNow <= rememberTextEntryTime) {
            billTextField.text = defaults.valueForKey("billFieldText") as! String
            onEditingChange(billTextField)
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.doubleForKey("defaultTipPercentage")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        billTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setValue(billTextField.text, forKey: "billFieldText")
        defaults.setValue(NSDate(), forKey: "lastTipTime")
        defaults.synchronize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChange(sender: AnyObject) {
        
        var roundedTipValue = floor(tipSlider.value)
        people = floor(Double(peopleSlider.value))
        
        tipPercentage = Double(roundedTipValue/100)
        
        if (billTextField.text != "") {
            
            billAmount = Double(billTextField.text!)!
            tipAmount = billAmount * tipPercentage
            total = billAmount + tipAmount
            total = total / people
            
            tipPercentageLabel.text = "\(Int(tipSlider.value))%"
            peopleLabel.text = "\(Int(peopleSlider.value))"
            
            var formattedTipAmount = String(tipAmount.asLocaleCurrency())
            var formattedTotal = String(total.asLocaleCurrency())
            
            tipLabel.text = formattedTipAmount
            totalLabel.text = formattedTotal
        }
    }
    
    @IBAction func sliderDidChange(sender: AnyObject) {
        
        onEditingChange(billTextField)
        
    }
    
    
    @IBAction func peopleSliderDidChange(sender: AnyObject) {
        
        onEditingChange(billTextField)
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
}

