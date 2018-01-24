//
//  displayDetailsViewController.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 1/24/18.
//  Copyright © 2018 Rahul Avale. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class displayDetailsViewController: UIViewController {
    
    var getname = String()

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Doners")
        query.whereKey("lastName", equalTo: getname)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
