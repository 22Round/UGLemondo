//
//  Extensions.swift
//  MyInstagram
//
//  Created by c0mrade on 4/30/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addMessageBox (with title: String? = nil) {
        let view = Bundle.main.loadNibNamed("Alert", owner: self, options: nil)![0] as! Alert
        view.frame = self.view.bounds
        view.strTitle = title
        if let delegate = (self as? AlertDelegate) {
            view.delegate = delegate
        }
        self.view.addSubview(view)
    }
    
}

extension UIView {
    
    func closeAnimationWithView (completion: @escaping () -> Void) {
        let transformToLowest = CGAffineTransform(scaleX: Constants.AppSettings.Transform_Min_Value, y: Constants.AppSettings.Transform_Min_Value)
        let transformToHighest = CGAffineTransform(scaleX: Constants.AppSettings.Transform_Max_Value, y: Constants.AppSettings.Transform_Max_Value)
        
        UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
            self.transform = transformToHighest
        }) { (_) in
            UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
                self.transform = transformToLowest
            }, completion: { (_) in
                completion()
            })
        }
    }
    
    func showAnimationWithView () {
        let transformToLowest = CGAffineTransform(scaleX: Constants.AppSettings.Transform_Min_Value, y: Constants.AppSettings.Transform_Min_Value)
        let transformToMiddle = CGAffineTransform(scaleX: Constants.AppSettings.Transform_Hig_Value, y: Constants.AppSettings.Transform_Hig_Value)
        let transformToHighest = CGAffineTransform(scaleX: Constants.AppSettings.Transform_Max_Value, y: Constants.AppSettings.Transform_Max_Value)
        
        self.transform = transformToLowest
        
        UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
            self.transform = transformToHighest
        }) { (_) in
            UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
                self.transform = .identity
            }, completion: { (_) in
                UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
                    self.transform = transformToMiddle
                }, completion: { (_) in
                    UIView.animate(withDuration: Constants.AppSettings.Animation_Min_Duration, animations: {
                        self.transform = .identity
                    })
                })
            })
        }
    }
    
}
