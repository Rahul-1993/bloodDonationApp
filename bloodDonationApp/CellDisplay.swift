//
//  CellDisplay.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 1/21/18.
//  Copyright © 2018 Rahul Avale. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class CellDisplay: PFTableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var bloodGroupLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var thoroughfareLabel: UILabel!
    @IBOutlet weak var localityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var pincodeLabel: UILabel!
}
