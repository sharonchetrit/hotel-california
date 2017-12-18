//
//  RegistrationController.swift
//  HotelManzana
//
//  Created by Sharon Chetrit on 18/12/2017.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class RegistrationController: UITableViewController {
    
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        let registration = registrations[indexPath.row]
        
        print("reg: \(registration)")
        
        let dateFormmatter = DateFormatter()
        dateFormmatter.dateStyle = .short
        
        cell.textLabel?.text = registration.firstName + "" + registration.lastName
        cell.detailTextLabel?.text = dateFormmatter.string(from: registration.checkInDate) + " - " + dateFormmatter.string(from: registration.checkOutDate) + " - " + registration.roomType.name
     
     // Configure the cell...
     
     return cell
     }
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationSegue = unwindSegue.source as? AddRegisterTableVC,
            let registration = addRegistrationSegue.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
        
    }
    
}
