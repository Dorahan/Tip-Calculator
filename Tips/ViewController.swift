//
//  ViewController.swift
//  Tips
//
//  Created by Dorahan Arapgirlioglu on 1/10/16.
//  Copyright © 2016 Dorahan Arapgirlioglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        numberOfPeopleLabel.text = "x 1"
        personLabel.text = "$0.00"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let peopleAmountControls = [1.0, 2.0, 3.0, 4.0, 5.0]
        let peopleAmountControl = peopleAmountControls[peopleControl.selectedSegmentIndex]
        
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let person = peopleAmountControl
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        let pnumber = total / person
        
        
        
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        numberOfPeopleLabel.text = "x \(person)"
        personLabel.text = "$\(pnumber)"
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        //personLabel.text = String(format: "$%.1f", person)
        
        
        
        
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    
    

}

