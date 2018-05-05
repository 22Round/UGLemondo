//
//  Extentions.swift
//  MyInstagram
//
//  Created by Vakhtangi Beridze on 4/16/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addViewController(ViewClass:ViewControllerProtocol.Type) {
        
        var theClassName: String {
            return String(describing: ViewClass)
        }
        
        print(navigationController?.viewControllers.count ?? "")
        
        if let viewControllers = self.navigationController?.viewControllers {

            for viewController in viewControllers {
                if viewController.isKind(of: ViewClass.self) {

                    navigationController?.popToViewController(viewController, animated: true)

                    return
                }
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: theClassName)
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

