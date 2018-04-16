//
//  ViewController.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController, ViewControllerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func btnScreen1Action(_ sender: UIButton) {
        
        addViewController(ViewClass: Screen1ViewController.self)
        
    }
}

