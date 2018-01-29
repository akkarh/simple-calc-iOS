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
    
    func evalFact() {
        if input.count > 1 {
            output.text = String("Error!")
        } else {
            let n = Int(input[0])
            var prod = 1
            for i in 1...n {
                prod *= i
            }
            output.text = "" + String(prod)
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
    
    func computeAvg() {
        var sum = 0
        for i in input {
            sum += Int(i)
            print(sum)
        }
        output.text = "" + String(sum / input.count)
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        if output.text != "" {
            curr = Double(output.text!)!
            switch operation {
            case "+" :
                output.text = String(prev + curr)
            case "-" :
                output.text = String(prev - curr)
            case "x" :
                output.text = String(prev * curr)
            case "/" :
                output.text = String(prev / curr)
            case "%" :
                output.text = String(prev.truncatingRemainder(dividingBy: curr))
            case "fact" :
                evalFact()
            case "count" :
                input.append(Double(output.text!)!)
                output.text = "" + String(input.count)
            case "avg" :
                input.append(Double(output.text!)!)
                computeAvg()
            default :
                output.text = "Error!"
            }
        }
        clear()
    }
    
    func clear() {
        prev = 0.0
        curr = 0.0
        opSelected = false
        operation = ""
        input = [Double]()
        newOp = true
    }
    
}

