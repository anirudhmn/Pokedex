//
//  Profile.swift
//  LoyaltyApp
//
//  Created by Anirudh Natarajan on 6/21/16.
//  Copyright (c) 2016 Anirudh. All rights reserved.
//

import Foundation
import UIKit

class Profile: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var joinedDate: UILabel!
    
    let stuff = AppDelegate()
    var tap: UIGestureRecognizer!
    var consumerManager: WFConsumerManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        consumerManager = WFConsumerManager(appID: "AA1234", appKey: "AA1234", companyInfo: WFCCompanyInfo(companyID: 3317), consumerID: "\(self.stuff.consumerID)", mode: WFCoreCPMode.PCEDev, completion: { (flag, errorList, exception) -> Void in
//            if flag{
//                
//            }
//        })
//        
//        let info = self.stuff.info!
//        firstName.text = info.firstName
//        lastName.text = info.lastName
//        email.text = info.personalInfo.contactInfo.emailInfo.emailAddress
//        phoneNumber.text = info.personalInfo.contactInfo.phoneInfo.phoneNumber
        
        tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        items.addObject("1")
        items.addObject("2")
        items.addObject("3")
        items.addObject("4")
        items.addObject("5")
        items.addObject("6")
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var items: NSMutableArray = NSMutableArray()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
    }
    
}

