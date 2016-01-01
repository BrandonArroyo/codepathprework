//
//  ViewController.swift
//  Tips
//
//  Created by Brandon Arroyo on 12/9/15.
//  Copyright © 2015 Brandon Arroyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var splitBill2Label: UILabel!
    @IBOutlet weak var splitBill3Label: UILabel!
    @IBOutlet weak var splitBill4Label: UILabel!
    @IBOutlet weak var splitNum2: UILabel!
    @IBOutlet weak var splitNum3: UILabel!
    @IBOutlet weak var splitNum4: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    

    @IBOutlet weak var splittwoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(10, forKey: "poorPercentage")
        defaults.setDouble(15, forKey: "mediumPercentage")
        defaults.setDouble(20, forKey: "goodPercentage")
        defaults.setBool(true, forKey: "switcherSelected")
        defaults.synchronize()
        
        
        
        billField.text = ""
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitBill2Label.alpha = 1
        splitBill3Label.alpha = 1
        splitBill4Label.alpha = 1
        splitLabel.alpha = 1

        splitNum2.alpha = 1
        splitNum3.alpha = 1
        splitNum4.alpha = 1
     
    }

override func viewWillAppear(animated: Bool) {
    
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
    
        let poor = defaults.doubleForKey("poorPercentage")
        let poorTitle = String(format: "%.f%%", poor)
        tipControl.setTitle(poorTitle, forSegmentAtIndex: 0)
    
        let medium = defaults.doubleForKey("mediumPercentage")
        let mediumTitle = String(format: "%.f%%", medium)
        tipControl.setTitle(mediumTitle, forSegmentAtIndex: 1)
    
        let good = defaults.doubleForKey("goodPercentage")
        let goodTitle = String(format: "%.f%%", good)
        tipControl.setTitle(goodTitle, forSegmentAtIndex: 2)
    
            splitBill2Label.alpha = 1
            splitBill3Label.alpha = 1
            splitBill4Label.alpha = 1
            splitNum2.alpha = 1
            splitNum3.alpha = 1
            splitNum4.alpha = 1
             splitLabel.alpha = 1
    
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var tipPercentages = [defaults.doubleForKey("poorPercentage"),defaults.doubleForKey("mediumPercentage"),defaults.doubleForKey("goodPercentage")]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage/100
        
        let total = billAmount + tip
          
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitBill2Label.text = String(format:"$%.2f", total/2)
        splitBill3Label.text = String(format:"$%.2f", total/3)
        splitBill4Label.text = String(format:"$%.2f", total/4)
      
    }

    @IBAction func keyboardAnimations(sender: AnyObject) {
        UIView.animateWithDuration(0.0, animations: {
            // This causes first view to fade in and second view to fade out
            self.splitBill2Label.alpha = 0
            self.splitBill3Label.alpha = 0
            self.splitBill4Label.alpha = 0
            self.splitNum2.alpha = 0
            self.splitNum3.alpha = 0
            self.splitNum4.alpha = 0
             self.splitLabel.alpha = 0
            
        })
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        if(view.endEditing(true)){
            UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
                self.splitBill2Label.alpha = 1
                self.splitBill3Label.alpha = 1
                self.splitBill4Label.alpha = 1
                self.splitLabel.alpha = 1
                self.splitNum2.alpha = 1
                self.splitNum3.alpha = 1
                self.splitNum4.alpha = 1
           
            })
        }
    
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.boolForKey("switcherSelected"){
            
            billField.text = ""
            totalLabel.text = "$0.00"
            tipLabel.text = "$0.00"
            splitBill2Label.text = "$0.00"
            splitBill3Label.text = "$0.00"
            splitBill4Label.text = "$0.00"
            print("Shake Event On")
        }
        else{
           print("Shake Event off")
        }
    }
}


