//
//  MenuVC.swift
//  Castrol
//
//  Created by Afiq Hamdan on 6/21/17.
//  Copyright © 2017 Cliqers. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var castrolImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    var menuImageArray:Array = [UIImage]()
    var menuNameArray:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuImageArray = [UIImage(named: "home")!,UIImage(named: "map")!,UIImage(named: "message")!,UIImage(named: "setting")!]
        menuNameArray = ["Home","Map","Message","Setting"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        cell.menuImage.image = menuImageArray[indexPath.row]
        cell.menuTitle.text! = menuNameArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController: SWRevealViewController = self.revealViewController()
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.menuTitle.text == "Home" {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            let newFrontController = UINavigationController.init(rootViewController: newViewController)
            
            revealViewController.pushFrontViewController(newFrontController, animated: true)
        }
        
        if cell.menuTitle.text == "Map" {
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = mainStoryboard.instantiateViewController(withIdentifier: "WorkshopLocatorVC") as! WorkshopLocatorVC
            let frontNewController = UINavigationController.init(rootViewController: newViewController)
            
            revealViewController.pushFrontViewController(frontNewController, animated: true)
        }
        
        if cell.menuTitle.text == "Message" {
            print("Message VC")
        }
        
        if cell.menuTitle.text == "Setting" {
            print("Setting VC")
        }
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
