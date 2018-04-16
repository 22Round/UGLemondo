//
//  LoginScreen.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController, ViewControllerProtocol {

    // MARK: - IBOutlets
    @IBOutlet fileprivate weak var topBar: UIView!
    @IBOutlet fileprivate weak var lblHeaderTitle: UILabel!
    @IBOutlet fileprivate weak var lblWelcomeText: UILabel!
    @IBOutlet fileprivate weak var txtUsername: UITextField!
    @IBOutlet fileprivate weak var txtPassword: UITextField!
    @IBOutlet fileprivate weak var btnAuthorize: UIButton!
    @IBOutlet fileprivate weak var btnRegister: UIButton!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction fileprivate func authorizeButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction fileprivate func registerButtonClicked(_ sender: UIButton) {
        
         addViewController(ViewClass: RegistrationScreen.self)
    }
    
}

protocol ViewControllerProtocol: AnyObject {
    //func didSearch(Parameters:[String: String]?)
}
