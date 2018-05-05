//
//  DetailScreen.swift
//  MyInstagram
//
//  Created by c0mrade on 4/28/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

//protocol DetailScreenDelegate: class {
//
//    func showMeSomeData ()
//
//}

class DetailScreen: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    
    // MARK: - Delegation
    // weak var delegate: DetailScreenDelegate?
    
    // MARK: - Properties
    var dataObject: MovieObject?
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewForDataUse()
        // delegate?.showMeSomeData()
        // Do any additional setup after loading the view.
    }
    
    private func configureViewForDataUse () {
        imgView.image = dataObject?.image
        lblTitle.text = dataObject?.name
    }
    
    // MARK: - IBActions
    @IBAction private func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func showXibOnView(_ sender: UIButton) {
        self.addMessageBox(with: "Our first messsage box is done from extension")
//        self.addMessageBox()
    }
    
}

// MARK: - AlertDelegate
extension DetailScreen: AlertDelegate {
    func alertHasBeenClosed() {
        self.view.backgroundColor = .red
    }
    
    func alertActionButtonTapped() {
        self.view.backgroundColor = .black
    }
    
    
}
