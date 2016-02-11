//
//  CalculatorViewController.swift
//  TipCalculator-Zappos
//
//  Created by Eric Suarez on 2/1/16.
//  Copyright © 2016 Eric Suarez. All rights reserved.
//

import UIKit

func add(a: Double, b: Double) -> Double {
    var result = a + b
    return result
}

func subtract(a: Double, b: Double) -> Double {
    var result = a - b
    return result
}

func multiply(a: Double, b: Double) -> Double {
    var result = a * b
    return result
}

func divide(a: Double, b: Double) -> Double {
    var result = a / b
    return result
}

typealias mathOperations = (Double, Double) -> Double
let operations: [String: mathOperations] = ["+": add, "-": subtract, "x": multiply, "÷": divide]

class CalculatorViewController: UIViewController {
    
    var input1: Double?
    var input2: Double?
    var isTyping = false
    var result: Double?
    var operand = ""
    var displayValue: Double = 0.0

//    var userInput = ""
//    
//    var numberStack: [Double] = []        // holds numbers
//    var operatorStack: [String] = []      // holds operators (+,-,*,/)
    
    @IBOutlet weak var displayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay(display: Double) {
        // If result is an int, don't display as double
        var formattedDisplay = Int(display)
        if display - Double(formattedDisplay) == 0 {
            displayLabel.text = "\(formattedDisplay)"
        } else {
            displayLabel.text = "\(display)"
        }
    }
    
    @IBAction func performClear(sender: AnyObject) {
        
        displayLabel.text = "0"
        input1 = 0.0
        input2 = 0.0
        result = 0.0
        isTyping = false
        
    }
    
    @IBAction func appendDigit(sender: AnyObject) {
    
        var digit = sender.currentTitle!
        if isTyping == true {
            displayLabel.text = "\(displayLabel.text!)\(digit!)"
        } else {
            displayLabel.text = digit!
        }
        
        isTyping = true
        //updateDisplay(Double(displayLabel.text!)!)
        
    }
    
    @IBAction func handleOperation(sender: AnyObject) {
        
        isTyping = false
        input1 = Double(displayLabel.text!)
        
        operand = sender.currentTitle!!
        
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
        
        input2 = Double(displayLabel.text!)
        
        var currentOperand = operations[operand]
        displayLabel.text = "\(currentOperand!(input1!, input2!))"
        updateDisplay(Double(displayLabel.text!)!)
        isTyping = false
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
