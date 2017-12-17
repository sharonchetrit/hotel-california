//
//  RegisterTableVC.swift
//  HotelManzana
//
//  Created by Sharon Chetrit on 13/12/2017.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegisterTableVC: UITableViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var checkInDateLbl: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLbl: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
    }

    @IBAction func DoneBarButtonItem(_ sender: UIBarButtonItem) {
        let firstN = firstName.text ?? ""
        let lastN = lastName.text ?? ""
        let mail = email.text ?? ""
        
        print("first name: \(firstN)")
        print("last name: \(lastN)")
        print("email: \(mail)")
    }
    
 
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    
    
    
    func updateDateView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLbl.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLbl.text = dateFormatter.string(from: checkOutDatePicker.date)
        
    }
    
}
