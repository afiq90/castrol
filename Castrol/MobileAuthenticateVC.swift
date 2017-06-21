//
//  MobileAuthenticateVC.swift
//  Castrol
//
//  Created by Cliqers on 16/06/2017.
//  Copyright © 2017 Cliqers. All rights reserved.
//

import UIKit
import FirebaseAuth

class MobileAuthenticateVC: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        
        //saved phone number to nsuserdefault, for resend code purpose
        let savedPhoneNumber = UserDefaults.standard
        savedPhoneNumber.set(phoneNumber.text, forKey: "phoneNumber")
        
        let yourPhoneNumber = "Is this you phone number \(String(describing: phoneNumber.text!))"
        
        let confirmationPopup = UIAlertController(title: "Phone Number", message: yourPhoneNumber, preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber(self.phoneNumber.text!) { (verificationID, error) in
                if error != nil {
                    print("error : \(String(describing: error?.localizedDescription))")
                } else {
                    let defaults = UserDefaults.standard
                    defaults.set(verificationID, forKey: "verificationID")
                    self.performSegue(withIdentifier: "verificationVC", sender: Any?.self)
                }
            }
        }
        let cancel = UIAlertAction(title: "No", style: .default, handler: nil)
        confirmationPopup.addAction(action)
        confirmationPopup.addAction(cancel)
        self.present(confirmationPopup, animated: true, completion: nil)
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
