//
//  recieveViewController.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 12/20/17.
//  Copyright © 2017 Rahul Avale. All rights reserved.
//

import UIKit
import Parse

class recieveViewController: UIViewController {

    @IBOutlet weak var pincodeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        PFUser.logOut()
        performSegue(withIdentifier: "logoutSegue", sender: self)
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        performSegue(withIdentifier: "displayTableViewSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destVC = segue.destination as! displayTableViewController
        if let passpincode = pincodeTextField.text {
        destVC.pincode = passpincode
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
