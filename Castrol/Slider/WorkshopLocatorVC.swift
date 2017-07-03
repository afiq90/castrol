//
//  WorkshopLocatorVC.swift
//  Castrol
//
//  Created by Afiq Hamdan on 6/21/17.
//  Copyright © 2017 Cliqers. All rights reserved.
//

import UIKit

class WorkshopLocatorVC: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rightViewRevealWidth = 150
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
