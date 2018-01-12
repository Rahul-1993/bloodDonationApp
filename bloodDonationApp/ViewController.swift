//
//  ViewController.swift
//  bloodDonationApp
//
//  Created by Rahul Avale on 12/17/17.
//  Copyright © 2017 Rahul Avale. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITextFieldDelegate {
    
    var signUpMode = true

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var changelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        usernameTextField.clearButtonMode = .always
        passwordTextField.clearButtonMode = .always
        confirmPasswordTextField.clearButtonMode = .always
        emailTextField.clearButtonMode = .always
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        emailTextField.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (signUpMode) {
            if textField == usernameTextField{
                
                passwordTextField.becomeFirstResponder()
                
            } else if textField == passwordTextField {
                
                confirmPasswordTextField.becomeFirstResponder()
                
            } else if textField == confirmPasswordTextField {
                
                emailTextField.becomeFirstResponder()
                
            } else {
                
                textField.resignFirstResponder()
                
            }
        } else {
            
            if textField == usernameTextField {
                
                passwordTextField.becomeFirstResponder()
                
            } else {
                
                textField.resignFirstResponder()
                
            }
            
        }
        return true
    }
    
    func displayAlert(alertTitle : String, alertMessage : String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("Alert action displayed!")
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }


    @IBAction func changeButtonAction(_ sender: Any) {
        if (signUpMode) {
            
            selectButton.setTitle("Log In", for: [])
            changeButton.setTitle("Sign Up", for: [])
            changelabel.text = "Don't have an account?"
            confirmPasswordTextField.isHidden = true
            emailTextField.isHidden = true
            signUpMode = false
            usernameTextField.text = ""
            passwordTextField.text = ""
            emailTextField.text = ""
            
        } else {
            
            selectButton.setTitle("Sign Up", for: [])
            changeButton.setTitle("Log In", for: [])
            changelabel.text = "Already have an acount?"
            confirmPasswordTextField.isHidden = false
            emailTextField.isHidden = false
            signUpMode = true
            usernameTextField.text = ""
            passwordTextField.text = ""
            emailTextField.text = ""

            
        }
    }
    
    @IBAction func selectButtonAction(_ sender: Any) {
        
        if(signUpMode) {
            
            if usernameTextField.text == "" || passwordTextField.text == "" || emailTextField.text == "" {
                
                displayAlert(alertTitle: "Incomplete Credentials", alertMessage: "Please fill up all three fields.")
                
            } else {
                
                if passwordTextField.text == confirmPasswordTextField.text {
                
                let user = PFUser()
                user.username = usernameTextField.text
                user.password = passwordTextField.text
                user.email = emailTextField.text
                user.signUpInBackground(block: { (user, error) in
                    if let error = error {
                        
                            self.displayAlert(alertTitle: "Could not sign you up", alertMessage: error.localizedDescription)
                            print("Could not sign you up!")
                        
                        }   else {
                        
                            //self.displayAlert(alertTitle: "Sign Up successful", alertMessage: "Welcome")
                            print("Sign up successful")
                            self.performSegue(withIdentifier: "testSegue", sender: self)
                        
                        }
                    })
                } else {
                    
                    displayAlert(alertTitle: "Passwords do not match", alertMessage: "Please try again")
                    
                }
            }
        } else {
            
            if usernameTextField.text == "" || passwordTextField.text == "" {
                
                displayAlert(alertTitle: "Incomplete Credentials", alertMessage: "Please fill up both the fields.")
                
            } else {
                
                PFUser.logInWithUsername(inBackground: usernameTextField.text!, password: passwordTextField.text!, block: { (user, error) in
                    if user != nil {
                        
                       // self.displayAlert(alertTitle: "Log in successful", alertMessage: "Welcome")
                        print("Log in successfull!")
                        self.performSegue(withIdentifier: "testSegue", sender: self)
                        
                    } else {
                        
                        var errorText = "Unknown error please try again!"
                        if let error = error {
                            
                            errorText = error.localizedDescription
                            
                        }
                         self.displayAlert(alertTitle: "Could not log in", alertMessage: errorText)
                        print("Could not log in!")
                    }
                })
            }
        }
    }
    
}

