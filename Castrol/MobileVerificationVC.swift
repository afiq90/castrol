//
//  MobileVerificationVC.swift
//  Castrol
//
//  Created by Cliqers on 16/06/2017.
//  Copyright © 2017 Cliqers. All rights reserved.
//

import UIKit
import FirebaseAuth

class MobileVerificationVC: UIViewController {

    @IBOutlet weak var verificationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verifyButtonTapped(_ sender: Any) {
        
        let verificationID = UserDefaults.standard.string(forKey: "verificationID")
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID!,
            verificationCode: verificationTextField.text!)
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("Error: \(String(describing: error.localizedDescription))")
                let errorAlert = UIAlertController(title: "Error", message: "Ooops wrong code!", preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                errorAlert.addAction(ok)
                self.present(errorAlert, animated: true, completion: nil)
                return
            }
            
            print("user phone number: \(String(describing: user?.phoneNumber))")
            let userInfo = user?.providerData[0]
            print("Provider ID: \(String(describing: userInfo?.providerID))")
            self.performSegue(withIdentifier: "MainVC", sender: Any?.self)
        }

    }

    @IBAction func resendCodeButtonTapped(_ sender: Any) {
        /*PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber.text!) { (verificationID, error) in
         if error != nil {
         print("error : \(String(describing: error?.localizedDescription))")
         } else {
         let defaults = UserDefaults.standard
         defaults.set(verificationID, forKey: "verificationID")
         self.performSegue(withIdentifier: "verificationVC", sender: Any?.self)
         }
         }*/
        
        //retrieve user phone number from userdefaults
        let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber")
        print(phoneNumber!)
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!) { (verificationID, error) in
            if error != nil {
                print("error : \(String(describing: error?.localizedDescription))")
            } else {
                let defaults = UserDefaults.standard
                defaults.set(verificationID, forKey: "verificationID")
            }
        }
        
    }
    

}
