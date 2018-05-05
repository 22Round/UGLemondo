//
//  Screen1ViewController.swift
//  MyInstagram
//
//  Created by Vakhtangi Beridze on 4/16/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class Screen1ViewController: UIViewController, ViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    
    @IBAction func btnReturnToRegisterAction(_ sender: UIButton) {
        
        addViewController(ViewClass: RegistrationScreen.self)
    }
}
