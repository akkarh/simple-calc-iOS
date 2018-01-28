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
    
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
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
        newOp = true
    }
    
}

