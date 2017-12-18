//
//  RegisterTableVC.swift
//  HotelManzana
//
//  Created by Sharon Chetrit on 13/12/2017.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class AddRegisterTableVC: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    var roomType: RoomType?
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var checkInDateLbl: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLbl: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var numberOfAdults: UILabel!
    
    
    @IBOutlet weak var numberOfChildren: UILabel!
    
    
    @IBOutlet weak var numberOfAdultStepper: UIStepper!
    
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var Switch: UISwitch!
    
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown : Bool = false {
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown : Bool = false{
        didSet{
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    
    
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
        
        updateDateView()
        updateNumberOfGuests()
        updateRoomType()
    }
    
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        }
        else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
            
        case (checkInDatePickerIndexPath.section, checkInDatePickerIndexPath.row):
            
            if isCheckInDatePickerShown {
                return 216.0
            } else {
                return 0
            }
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row):
            
            if isCheckOutDatePickerShown {
                return 216.0
            } else {
                return 0
            }
        default:
            return 44.0
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
            
        case (checkInDatePickerIndexPath.section,checkInDatePickerIndexPath.row - 1):
            if isCheckInDatePickerShown{
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            }else{
                isCheckInDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerIndexPath.section, checkOutDatePickerIndexPath.row - 1):
            if isCheckOutDatePickerShown{
                isCheckOutDatePickerShown = false
            }else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            }else{
                isCheckOutDatePickerShown = true
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    
    

    @IBAction func DoneBarButtonItem(_ sender: UIBarButtonItem) {
        let firstN = firstName.text ?? ""
        let lastN = lastName.text ?? ""
        let mail = email.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = Switch.isOn
        let roomChoice = roomType?.name ?? "Not Set"
        
        print("first name: \(firstN)")
        print("last name: \(lastN)")
        print("email: \(mail)")
        print("checkIn: \(checkInDate)")
        print("checkOut: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("wifi: \(hasWifi)")
        print("roomType: \(roomChoice)")
    }
    
    
 
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    
    
    
    
    func updateDateView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLbl.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLbl.text = dateFormatter.string(from: checkOutDatePicker.date)
        
    }
    
    func updateNumberOfGuests() {
        
        numberOfAdults.text = "\(Int(numberOfAdultStepper.value))"
        numberOfChildren.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            
            destinationViewController?.delegate = self as? SelectRoomTypeTableViewControllerDelegate
            destinationViewController?.roomType = roomType
        }
    }
}
