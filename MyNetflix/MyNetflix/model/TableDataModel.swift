//
//  TableDataModel.swift
//  MyNetflix
//
//  Created by Vakhtangi Beridze on 5/10/18.
//  Copyright © 2018 22Round. All rights reserved.
//

import Foundation
import UIKit


struct CellDetails {
    let id:Int!
    let image:UIImage!
}

struct CellData {
    let cellType:Int!
    let title:String?
    let action:String?
    let data:[CellDetails]!
    
}
