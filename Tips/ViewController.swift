//
//  ViewController.swift
//  Tips
//
//  Created by Dorahan Arapgirlioglu on 1/10/16.
//  Copyright © 2016 Dorahan Arapgirlioglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleControl: UISegmentedControl!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    
    
    var animateView = false
    var animateBackView = false
    var morePeopleView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        numberOfPeopleLabel.text = "x 1"
        personLabel.text = "$0.00"
        
        billField.attributedPlaceholder = NSAttributedString(string: "$", attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        
//        billField.layer.cornerRadius = 10.0
//        billField.clipsToBounds = true
//        billField.backgroundColor = UIColor(red: 156/255, green: 189/255, blue: 199/255, alpha: 0.1)
        
        billField.frame.origin.y = 210
        billLabel.frame.origin.y = 250
        billField.font = billField.font?.fontWithSize(50)
        billLabel.text = "Enter Bill"
        
        
        
        firstView.frame.size.height = 570
        firstView.backgroundColor = UIColor(red: 39/255, green: 47/255, blue: 50/255, alpha: 1)
        
       
        self.secondView.alpha = 0
        //self.firstView.alpha = 1
        //animateViews()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        animateView = billField.text?.characters.count > 0
        animateViews()
        
        animateBackView = animateView
        if(animateView == false){
            animateBackViews()
        }
        
        
        
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
        
        
        //ANIMATION
       /* UIView.animateWithDuration(0.4, animations: {
            self.secondView.alpha = 1
            //self.firstView.frame.size.height = 110
        })
        
        UIView.animateWithDuration(0.2, animations: {
            //self.secondView.alpha = 1
            self.firstView.frame.size.height = 110
        })
        */
        
        if(person > 1.0){
            personLabel.textColor = UIColor.redColor()
            personLabel.font = UIFont.systemFontOfSize(17.0, weight: UIFontWeightBold)
            
        } else {
            personLabel.textColor = UIColor.grayColor()
            personLabel.font = UIFont.systemFontOfSize(17.0, weight: UIFontWeightLight)
        }
        
        
        
        
    }
    /*
    override func setEditing(editing: Bool, animated: Bool) {
        view.endEditing(true)
    }
    */
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    
    func animateViews(){
        UIView.animateWithDuration(0.4, animations: {
        self.secondView.alpha = self.animateView ? 1 : 0
        self.billField.font = self.billField.font?.fontWithSize(24)
        self.billLabel.text = "Bill"
            })
        UIView.animateWithDuration(0.2, animations: {
        self.firstView.frame.size.height = 110
            self.billField.frame.origin.y = 12
            self.billLabel.frame.origin.y = 53
        })
    }
    
    func animateBackViews(){
        UIView.animateWithDuration(0.4, animations: {
            self.firstView.frame.size.height = 570
            self.billField.frame.origin.y = 210
            self.billLabel.frame.origin.y = 250
            self.billField.font = self.billField.font?.fontWithSize(50)
            self.billLabel.text = "Enter Bill"
        })
    }
    

}

