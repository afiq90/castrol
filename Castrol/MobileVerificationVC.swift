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
                return
            }
            
            print("user phone number: \(user?.phoneNumber)")
            let userInfo = user?.providerData[0]
            print("Provider ID: \(userInfo?.providerID)")
            self.performSegue(withIdentifier: "MainVC", sender: Any?.self)
        }

    }

    

}
