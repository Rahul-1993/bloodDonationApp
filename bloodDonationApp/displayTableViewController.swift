//
//  displayTableViewController.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 1/21/18.
//  Copyright © 2018 Rahul Avale. All rights reserved.
//

import UIKit
import Parse
import ParseUI

var myIndex = 0

class displayTableViewController: PFQueryTableViewController {
    
    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "Doners")
        query.order(byAscending: "lastName")
        return query
    }

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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellDisplay
        cell.firstNameLabel.text = object?.object(forKey: "firstName") as? String
        cell.lastNameLabel.text = object?.object(forKey: "lastName") as? String
        cell.ageLabel.text = object?.object(forKey: "age") as? String
        cell.sexLabel.text = object?.object(forKey: "sex") as? String
        cell.bloodGroupLabel.text = object?.object(forKey: "bloodGroup") as? String
        cell.phoneLabel.text = object?.object(forKey: "phoneContact") as? String
        cell.emailLabel.text = object?.object(forKey: "emailContact") as? String
        cell.thoroughfareLabel.text = object?.object(forKey: "thoroughfare") as? String
        cell.localityLabel.text = object?.object(forKey: "locality") as? String
        cell.stateLabel.text = object?.object(forKey: "administrativeArea") as? String
        cell.pincodeLabel.text = object?.object(forKey: "postalCode") as? String
        
        return cell
 
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
