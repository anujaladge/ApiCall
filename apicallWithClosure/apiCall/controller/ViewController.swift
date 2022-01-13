//
//  ViewController.swift
//  apicallWithClosure
//
//  Created by Mac on 11/01/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    let api = ApiManager()       //1
    
    var allUserInfo = [userInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        api.getData { (userDeatails) in
            self.allUserInfo = userDeatails
            print(userDeatails)
            
        
        
        
//        api.getData { (userDeatils) in
//            self.allUserInfo = userDeatils
//            print(self.allUserInfo)
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        tableview.delegate = self
        tableview.dataSource = self
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUserInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellS")
        cell?.textLabel?.text = allUserInfo[indexPath.row].name
        cell?.detailTextLabel?.text = allUserInfo[indexPath.row].username
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userVC = storyboard?.instantiateViewController(withIdentifier: "userinfoViewController") as! userinfoViewController
        userVC.username = allUserInfo[indexPath.row].name
        userVC.useremail = allUserInfo[indexPath.row].email
        userVC.userphone = allUserInfo[indexPath.row].phone
        userVC.usercity = allUserInfo[indexPath.row].address.city
        userVC.userzipcode = allUserInfo[indexPath.row].address.zipcode
        userVC.userwebsite = allUserInfo[indexPath.row].website
        title = "allUsers"
        navigationController?.pushViewController(userVC, animated: true)
        
    }


}

