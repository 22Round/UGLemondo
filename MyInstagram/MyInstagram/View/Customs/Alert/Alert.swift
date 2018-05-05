//
//  Alert.swift
//  MyInstagram
//
//  Created by c0mrade on 4/28/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

protocol AlertDelegate: class {
    func alertHasBeenClosed ()
    func alertActionButtonTapped ()
}

class Alert: UIView {
    
    // MARK: IBOutlets
    @IBOutlet private weak var messageBox: UIView!
    @IBOutlet private weak var lblText: UILabel!
    
    // MARK: - Delegation
    weak var delegate: AlertDelegate?
    var strTitle: String?
    
    // MARK: - View LifeCycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        messageBox.showAnimationWithView()
        messageBox.layer.cornerRadius = 10
        
        if let str = strTitle {
            lblText.text = str
        }
    }
    
    private func closeAlertView (fromAction: Bool = false) {
        self.messageBox.closeAnimationWithView { [weak self] in
            self?.removeFromSuperview()
            
            fromAction ? self?.delegate?.alertActionButtonTapped() : self?.delegate?.alertHasBeenClosed()
        }
    }
    
    // MARK: - IBAction
    @IBAction func boomButtonTapped(_ sender: UIButton) {
        closeAlertView(fromAction: true)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        closeAlertView()
    }
    
    @IBAction func tapGestureActivated(_ sender: UITapGestureRecognizer) {
        closeAlertView()
    }
    
    deinit {
        print("AlertView Deallocated")
    }
    
}
