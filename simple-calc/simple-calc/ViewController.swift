//
//  ViewController.swift
//  simple-calc
//
//  Created by Harshitha Akkaraju on 1/26/18.
//  Copyright © 2018 Harshitha Akkaraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var prev = 0.0
    var curr = 0.0
    var opSelected = false
    var operation = ""
    var newOp = false
    var decimal = false
    var input = [Double]()
    
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        // clear the screen when operation is selected
        // or when one operation has been evaluated
        if (opSelected || newOp) {
            output.text = ""
            opSelected = false
            newOp = false
        }
        output.text = output.text! + String(sender.tag - 1)
    }
    
    @IBAction func decimal(_ sender: UIButton) {
        if (!decimal) {
            output.text = output.text! + String(".")
            decimal = true
        }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        output.text = ""
        clear()
    }
    
    @IBAction func operation(_ sender: UIButton) {
        if !opSelected {
            prev = Double(output.text!)!
            output.text = ""
            opSelected = true
            operation = sender.titleLabel!.text!
        }
    }
    
    @IBAction func factPressed(_ sender: UIButton) {
        if !opSelected {
            opSelected = true
            operation = sender.titleLabel!.text!
            newOp = false
        }
        input.append(Double(output.text!)!)
    }
    
    func evalFact() -> String {
        if input.count > 1 {
            return String("Error!")
        } else {
            let n = Int(input[0])
            var prod = 1
            for i in 1...n {
                prod *= i
            }
            return "" + String(prod)
        }
    }
    
    @IBAction func countPressed(_ sender: UIButton) {
        if !opSelected {
            opSelected = true
            operation = "count"
            newOp = false
        }
        input.append(Double(output.text!)!)
    }
    
    @IBAction func avgPressed(_ sender: UIButton) {
        if !opSelected {
            opSelected = true
            operation = "avg"
            newOp = false
        }
        input.append(Double(output.text!)!)
    }
    
    func computeAvg() -> String {
        var sum = 0.0
        for i in input {
            sum += i
        }
        return "" + String(sum / Double(input.count))
    }
    
    func displayResult(_ result: String) {
        if result != "" && result != "Error!" {
            if (decimal) {
                output.text = result
            } else {
                let num = Double(result)
                output.text = String(Int(num!))
            }
        }
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        var result = ""
        if output.text != "" {
            curr = Double(output.text!)!
            switch operation {
            case "+" :
                result = String((prev + curr))
            case "-" :
                result = String((prev - curr))
            case "x" :
                result = String((prev * curr))
            case "/" :
                result = String((prev / curr))
            case "%" :
                result = String(prev.truncatingRemainder(dividingBy: curr))
            case "fact" :
                result = evalFact()
            case "count" :
                input.append(Double(output.text!)!)
                result = "" + String(input.count)
            case "avg" :
                input.append(Double(output.text!)!)
                result = computeAvg()
            default :
                output.text = "Error!"
            }
        }
        displayResult(result)
        clear()
    }
    
    func clear() {
        prev = 0.0
        curr = 0.0
        opSelected = false
        operation = ""
        decimal = false
        input = [Double]()
        newOp = true
    }
    
}

