//
//  SignUpViewController.swift
//  Padala
//
//  Created by Vamshi krishna Padala on 4/8/17.
//  Copyright © 2017 Vamshi krishna Padala. All rights reserved.
//

import UIKit
import Foundation

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var firstnameLabel: UILabel!
    
    @IBOutlet weak var firstnameTxtField: UITextField!
    
    
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var lastnameTxtField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameTxtField.delegate = self
        lastnameTxtField.delegate = self
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
        
        signupBtn.layer.shadowRadius = 8
        signupBtn.layer.shadowOpacity = 8
        signupBtn.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    @IBAction func backButtonTapped(_sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController: UIViewController? = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController!, animated: true)
    }
    @IBAction func signupButtonTapped(_sender: Any){
        let alert = UIAlertController(title: "Succcess", message: "You've successfully signed up with CodeForce 360", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    func dismissKeyboard() {
        self.firstnameTxtField.resignFirstResponder()
        self.lastnameTxtField.resignFirstResponder()
        self.emailTxtField.resignFirstResponder()
        self.passwordTxtField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let firstName = firstnameTxtField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            firstName.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            firstnameTxtField.resignFirstResponder()
        }
        if let lastName = lastnameTxtField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            lastName.becomeFirstResponder()
        }else {
            lastnameTxtField.resignFirstResponder()
        }
        if let email = emailTxtField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            email.becomeFirstResponder()
        }else {
            emailTxtField.resignFirstResponder()
        }
        if let password = passwordTxtField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            password.becomeFirstResponder()
        }else {
            passwordTxtField.resignFirstResponder()
        }
        return false
    }

}

