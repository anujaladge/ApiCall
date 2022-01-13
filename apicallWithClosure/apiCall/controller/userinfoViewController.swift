//
//  userinfoViewController.swift
//  apicallWithClosure
//
//  Created by Mac on 11/01/22.
//

import UIKit

class userinfoViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    
    @IBOutlet weak var label5: UILabel!
    
    
    @IBOutlet weak var label6: UILabel!
    
    
    
    
    
    
    
    var username = ""
    var useremail = ""
    var userphone = ""
    var usercity = ""
    var userzipcode = ""
    var userwebsite = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        label1.text = username
        label2.text = useremail
        label3 .text = userphone
        label4.text = usercity
        label5.text = userzipcode
        label6.text = userwebsite
        title = "Detailed user info"
       }
    }
