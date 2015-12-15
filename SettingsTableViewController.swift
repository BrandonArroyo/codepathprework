//
//  SettingsTableViewController.swift
//  Tips
//
//  Created by Brandon Arroyo on 12/12/15.
//  Copyright © 2015 Brandon Arroyo. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
  
    @IBOutlet weak var poorLabel: UILabel!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var poorStepper: UIStepper!
    @IBOutlet weak var mediumStepper: UIStepper!
    @IBOutlet weak var goodStepper: UIStepper!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        poorLabel.text = String(format: "%.0f%%", defaults.doubleForKey("poorPercentage"))
        poorStepper.value = defaults.doubleForKey("poorPercentage")
        
        mediumLabel.text = String(format: "%.0f%%", defaults.doubleForKey("mediumPercentage"))
        mediumStepper.value = defaults.doubleForKey("mediumPercentage")
        
        goodLabel.text = String(format: "%.0f%%", defaults.doubleForKey("goodPercentage"))
        goodStepper.value = defaults.doubleForKey("goodPercentage")
        
        defaults.synchronize()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func poorStepValueChange(sender: AnyObject) {
        
        poorStepper.maximumValue = mediumStepper.value - 1
        
        mediumStepper.minimumValue = poorStepper.value + 1
        
        poorLabel.text = String(format: "%.0f%%", poorStepper.value)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("poorPercentage")
        defaults.setDouble(poorStepper.value, forKey: "poorPercentage")
        defaults.synchronize()
        
    }
    
    
    @IBAction func mediumStepValueChange(sender: AnyObject) {
        poorStepper.maximumValue = mediumStepper.value - 1
        
        mediumStepper.minimumValue = poorStepper.value + 1
        mediumStepper.maximumValue = goodStepper.value - 1
        
        goodStepper.minimumValue = mediumStepper.value + 1
            
        mediumLabel.text = String(format: "%.0f%%", mediumStepper.value)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("mediumPercentage")
        defaults.setDouble(mediumStepper.value, forKey: "mediumPercentage")
        defaults.synchronize()
    }
    
    @IBAction func goodStepValueChange(sender: AnyObject) {
        goodStepper.maximumValue = 100
        goodStepper.minimumValue = mediumStepper.value + 1
        
        mediumStepper.maximumValue = goodStepper.value - 1
        
        goodLabel.text = String(format: "%.0f%%", goodStepper.value)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.removeObjectForKey("goodPercentage")
        defaults.setDouble(goodStepper.value, forKey: "goodPercentage")
        defaults.synchronize()
        
        
    }

    

}
