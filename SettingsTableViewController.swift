//
//  SettingsTableViewController.swift
//  Tips
//
//  Created by Brandon Arroyo on 12/12/15.
//  Copyright © 2015 Brandon Arroyo. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
  
    //labels
    
    @IBOutlet weak var poorLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!
    
    //steppers
    
    @IBOutlet weak var poorStepper: UIStepper!
    @IBOutlet weak var mediumStepper: UIStepper!
    @IBOutlet weak var goodStepper: UIStepper!
        
    //Ui switch selector for the shaking
 
    @IBOutlet weak var shakeSelector: UISwitch!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //defaults initialization
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        //poor value interaction for label and stepper
        
        poorLabel.text = String(format: "%.0f%%", defaults.doubleForKey("poorPercentage"))
        poorStepper.value = defaults.doubleForKey("poorPercentage")
        
        //medium value interaction for label and stepper
        
        mediumLabel.text = String(format: "%.0f%%", defaults.doubleForKey("mediumPercentage"))
        mediumStepper.value = defaults.doubleForKey("mediumPercentage")
        
        //good value for stepper and label
        
        goodLabel.text = String(format: "%.0f%%", defaults.doubleForKey("goodPercentage"))
        goodStepper.value = defaults.doubleForKey("goodPercentage")
        
        //default value for  selector
        
        shakeSelector.on = defaults.boolForKey("switcherSelected")
        
        //making sure the system is synched 
        
        defaults.synchronize()
        
        //unused code that came with the app start up commented out for now
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    // this function will handle max value for poor stepper  and max value for the medium stepper
    @IBAction func poorStepValueChange(sender: AnyObject) {
        
        
        // poor stepper max value and altering the text
        poorStepper.maximumValue = mediumStepper.value - 1
        poorLabel.text = String(format: "%.0f%%", poorStepper.value)
        
        //setting the medium stepper minimum value
        mediumStepper.minimumValue = poorStepper.value + 1
        
       
        //setting the defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("poorPercentage")
        defaults.setDouble(poorStepper.value, forKey: "poorPercentage")
        defaults.synchronize()
        
    }
    
    
    
 
    //this function sets mediums upper and lower limits and the good stepper lower limit and poor steppers max limit
    @IBAction func mediumStepValueChange(sender: AnyObject) {
        //poor row
        poorStepper.maximumValue = mediumStepper.value - 1
        //medium row
        mediumStepper.minimumValue = poorStepper.value + 1
        mediumStepper.maximumValue = goodStepper.value - 1
        
        mediumLabel.text = String(format: "%.0f%%", mediumStepper.value)
        //good row
        goodStepper.minimumValue = mediumStepper.value + 1
            
        
        //default setting
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("mediumPercentage")
        defaults.setDouble(mediumStepper.value, forKey: "mediumPercentage")
        defaults.synchronize()
    }
    //this function sets the max tip percent for good ad the max value for the medium
    @IBAction func goodStepValueChange(sender: AnyObject) {
        //medium row
        mediumStepper.maximumValue = goodStepper.value - 1
        //good row
        goodStepper.maximumValue = 100
        goodStepper.minimumValue = mediumStepper.value + 1
        
        goodLabel.text = String(format: "%.0f%%", goodStepper.value)
        
        //defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("goodPercentage")
        defaults.setDouble(goodStepper.value, forKey: "goodPercentage")
        defaults.synchronize()
        
        
    }
    //handle the state change for the switcher
    @IBAction func switchChanged(sender: AnyObject) {
        if shakeSelector.on{
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(true, forKey: "switcherSelected")
            defaults.synchronize()
        }
        else{
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(false, forKey: "switcherSelected")
            defaults.synchronize()
        }
        
    }
 
}
