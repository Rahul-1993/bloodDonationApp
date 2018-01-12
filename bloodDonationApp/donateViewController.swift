//
//  donateViewController.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 12/20/17.
//  Copyright © 2017 Rahul Avale. All rights reserved.
//

import UIKit
import Parse
import CoreLocation

class donateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var sexTextfield: UITextField!
    @IBOutlet weak var ageTextfield: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var manager = CLLocationManager()
    var doner = PFObject(className: "Doners")
    let bloodTypes = ["O-", "O+", "A-", "A+", "B-", "B+", "AB-", "AB+"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bloodTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bloodTypes.count
    }
    
    func displayAlert(alertTitle : String, alertMessage : String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("Alert action displayed!")
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
       
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil {
                print(error!)
                
            } else {
                
                if let placemark = placemarks?[0] {
                    
                    var thoroughfare = ""
                    var subLocality = ""
                    var locality = ""
                    var subAdministrativeArea = ""
                    var administrativeArea = ""
                    var postalCode = ""
                    
                    
                    if placemark.subThoroughfare != nil {
                        
                        thoroughfare = placemark.subThoroughfare!
                        
                    }
                    
                    if placemark.thoroughfare != nil {
                        
                        thoroughfare += " " + placemark.thoroughfare!
                        
                        
                    }
                    
                    if placemark.subLocality != nil {
                        
                        subLocality = placemark.subLocality!
                        
                    }
                    
                    if placemark.locality != nil {
                        
                        locality = placemark.locality!
                        
                    }
                    
                    if placemark.subAdministrativeArea != nil {
                        
                        subAdministrativeArea = placemark.subAdministrativeArea!
                        
                    }
                    
                    if placemark.administrativeArea != nil {
                        
                        administrativeArea = placemark.administrativeArea!
                        
                    }
                    
                    if placemark.postalCode != nil {
                        
                        postalCode = placemark.postalCode!
                        
                    }
                    
                    
                    self.doner["thoroughfare"] = thoroughfare
                    self.doner["subLocality"] = subLocality
                    self.doner["subAdministrativeArea"] = subAdministrativeArea
                    self.doner["postalCode"] = postalCode
                    self.doner["locality"] = locality
                    self.doner["administrativeArea"] = administrativeArea
                    self.doner.saveInBackground(block: { (success, error) in
                        if (success) {
                            print("Successfully saved the address")
                        } else {
                            print("Failed")
                        }
                    })
                    
                    //print(address)
                }
                
            }
        }
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
        
        if firstnameTextfield.text == "" || lastnameTextfield.text == "" || sexTextfield.text == "" || ageTextfield.text == "" {
            
            displayAlert(alertTitle: "Incomplete Information", alertMessage: "Please fill up all the boxes")
            
        } else {
            
            let row = pickerView.selectedRow(inComponent: 0)
            let type = bloodTypes[row] as String
            
            manager.startUpdatingLocation()
            
            doner["firstName"] = firstnameTextfield.text
            doner["lastName"] = lastnameTextfield.text
            doner["sex"] = sexTextfield.text
            doner["age"] = ageTextfield.text
            doner["emailContact"] = emailTextField.text
            doner["phoneContact"] = phoneTextField.text
            doner["bloodGroup"] = type
            doner.saveInBackground(block: { (success, error) in
                if (success) {
                    print("Success saved personal information")
                } else {
                    print("Failed")
                }
            })
            
            //manager.stopUpdatingLocation()
            
        }
            
    
        
    }
        /*let row = pickerView.selectedRow(inComponent: 0)
        let type = bloodTypes[row] as String
        let check = PFObject(className: "Check")
        check["name"] = "Rahul"
        check["type"] = type
        check.saveInBackground { (success, error) in
            if (success) {
                print("Success")
            } else {
                print("Failed")
            }
        }
        
    }*/
    
}
