//
//  ViewController.swift
//  UberRideCall
//
//  Created by Matt Milner on 8/3/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var successfullyAddedLabel: UILabel!
    @IBOutlet weak var rideIsScheduledLabel: UILabel!
    @IBOutlet weak var rideTimeLabel: UILabel!
    let notification = UILocalNotification()

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.setValue(UIColor.greenColor(), forKeyPath: "textColor")
        datePicker.backgroundColor = UIColor.blackColor()
        datePicker.setValue(false, forKey: "highlightsToday")
        datePicker.hidden = true
        doneButton.hidden = true
        successfullyAddedLabel.hidden = true
        rideIsScheduledLabel.hidden = true
        rideTimeLabel.hidden = true

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createNotification() {
        
        datePicker.hidden = false
        doneButton.hidden = false
        rideIsScheduledLabel.hidden = true
        rideTimeLabel.hidden = true
        
    }

    
    @IBAction func doneButtonPressed() {
        
        datePicker.hidden = true
        doneButton.hidden = true
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .ShortStyle
        rideTimeLabel.text = dateFormatter.stringFromDate(datePicker.date)
        
        
        notification.alertTitle = "Uber Ready!"
        notification.alertBody = "Are You Ready? Your Uber is Waiting!"
        notification.fireDate = datePicker.date
        notification.category = "readyCategory"
        notification.userInfo = ["fireDate":datePicker.date]
        
        successfullyAddedLabel.hidden = false
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        UIView.animateWithDuration(2.0, animations: {
            self.successfullyAddedLabel.alpha = 0.0
            }) { (finished) in
                self.successfullyAddedLabel.hidden = true
                self.successfullyAddedLabel.alpha = 1.0

        }
        
        
        
        
    }

}

