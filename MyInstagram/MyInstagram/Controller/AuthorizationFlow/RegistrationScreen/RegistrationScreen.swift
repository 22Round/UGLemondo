//
//  RegistrationScreen.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class RegistrationScreen: UIViewController, ViewControllerProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func btnBack(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func btnRegisteredAction(_ sender: Any) {
        
        addViewController(ViewClass: HomeScreen.self)
        
    }
    
}
