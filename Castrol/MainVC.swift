//
//  MainVC.swift
//  Castrol
//
//  Created by Afiq Hamdan on 6/18/17.
//  Copyright © 2017 Cliqers. All rights reserved.
//

import UIKit
import StoreKit

class MainVC: UIViewController, SKStoreProductViewControllerDelegate {
    var storeProductViewController = SKStoreProductViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeProductViewController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func secretAppButtonTapped(_ sender: Any) {
        launchAppStoreUsingStorekit()
    }
    
    func launchAppStoreUsingUIApplication() {
        //app store url
        let appStoreLink = "https://itunes.apple.com/my/app/motorist/id899516747?mt=8"
        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                if success {
                    print("Launching \(url) was successful")
                }
            })
        }
    }
    
    func launchAppStoreUsingStorekit() {
        //Create a product dictionary using the app store itunes identifier
        let paramatersDict = [SKStoreProductParameterITunesItemIdentifier: 899516747]
        
        storeProductViewController.loadProduct(withParameters: paramatersDict) { (status, error) in
            if status {
                self.present(self.storeProductViewController, animated: true, completion: nil)
            } else {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        //dismiss SKStoreProductViewController view
        viewController.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
