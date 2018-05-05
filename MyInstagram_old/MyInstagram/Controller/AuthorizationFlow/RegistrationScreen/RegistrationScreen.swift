//
//  RegistrationScreen.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class RegistrationScreen: UIViewController, ViewControllerProtocol {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func btnBack(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func btnRegisteredAction(_ sender: Any) {
        
        let user = txtUserName.text
        let pass = txtPassword.text
        
        guard let checkUserLength = user?.count, (checkUserLength > 3 && checkUserLength < 10) else {return}
        guard let checkPassLength = pass?.count, (checkPassLength > 3 && checkPassLength < 10)  else {return}
        
        UserDefaults.standard.set(user, forKey: "user")
        UserDefaults.standard.set(pass, forKey: "pass")
        
        addViewController(ViewClass: LoginScreen.self)
        
    }
    
}
