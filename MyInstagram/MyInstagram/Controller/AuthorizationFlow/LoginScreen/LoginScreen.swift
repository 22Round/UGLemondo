//
//  LoginScreen.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet fileprivate weak var topBar: UIView!
    @IBOutlet fileprivate weak var lblHeaderTitle: UILabel!
    @IBOutlet fileprivate weak var lblWelcomeText: UILabel!
    @IBOutlet fileprivate weak var btnAuthorize: UIButton!
    @IBOutlet fileprivate weak var btnRegister: UIButton!
    
    @IBOutlet fileprivate weak var txtUsername: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction fileprivate func authorizeButtonClicked(_ sender: UIButton) {
        let username = txtUsername.text
        let password = txtPassword.text
        
        let definedUsername = UserDefaults.standard.object(forKey: "username") as! String
        let definedPassword = UserDefaults.standard.object(forKey: "password") as! String
        
        if username == definedUsername && password == definedPassword {
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeScreen") as! HomeScreen
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @IBAction fileprivate func registerButtonClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationScreen") as! RegistrationScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
