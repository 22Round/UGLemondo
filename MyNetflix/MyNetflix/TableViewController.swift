//
//  TableViewController.swift
//  MyNetflix
//
//  Created by Vakhtangi Beridze on 5/8/18.
//  Copyright © 2018 22Round. All rights reserved.
//

import UIKit


class HeaderCell: TableBaseCell {
    
    //MARK: - outlets
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    override func layoutSubviews() {
        
    }
    
    //MARK: - outlets
    
    @IBAction func btnAction(_ sender: UIButton) {
        
    }
    
}

class TableViewController: UITableViewController {
    
    @IBOutlet weak var headerImg: UIImageView!
    
    
    var collectionOfCellData = [CellData]()
    
    let CELL_TYPE_ID_1:String = "prevCell"
    let CELL_TYPE_ID_2:String = "filmsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOfCellData = [CellData(cellType: 1,title:"", action: "headerAction", data: [CellDetails(id: 1, image:#imageLiteral(resourceName: "bmw_e39_m5"))]),
                                
                                CellData(cellType: 2,title:"Preview", action: "previewAction", data: [CellDetails(id: 1, image: #imageLiteral(resourceName: "spiderman_homecoming_2017")),
                                                                                                    CellDetails(id: 2, image: #imageLiteral(resourceName: "league_of_legends_guardian")),
                                                                                                    CellDetails(id: 3, image: #imageLiteral(resourceName: "spiderman_homecoming_2017")),
                                                                                                    CellDetails(id: 4, image: #imageLiteral(resourceName: "rome_4"))]),
                                
                                CellData(cellType: 3,title:"Preview", action: "previewAction", data: [CellDetails(id: 1, image: #imageLiteral(resourceName: "spiderman_homecoming_2017")),
                                                                                                    CellDetails(id: 2, image: #imageLiteral(resourceName: "league_of_legends_guardian")),
                                                                                                    CellDetails(id: 3, image: #imageLiteral(resourceName: "spiderman_homecoming_2017")),
                                                                                                    CellDetails(id: 4, image: #imageLiteral(resourceName: "rome_4"))])
        ]
        tableView.backgroundColor = .black
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(PreviewTableCell.self, forCellReuseIdentifier: CELL_TYPE_ID_1)
        tableView.register(FilmsTableCell.self, forCellReuseIdentifier: CELL_TYPE_ID_2)
        
        headerImg.image = UIImage(named: "netflix_logo")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collectionOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if collectionOfCellData[indexPath.row].cellType == 1 {
            
            let cell = Bundle.main.loadNibNamed("AdsHeader", owner: self, options: nil)!.first as! HeaderCell
            
            let cellImage:UIImage = collectionOfCellData[indexPath.row].data[0].image
            
            cell.headerImage.image = cellImage
            return cell
            
        }else if collectionOfCellData[indexPath.row].cellType == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_TYPE_ID_1, for: indexPath)
            //let cell = Bundle.main.loadNibNamed("AdsHeader", owner: self, options: nil)!.first as! HeaderCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_TYPE_ID_2, for: indexPath)
            //let cell = Bundle.main.loadNibNamed("AdsHeader", owner: self, options: nil)!.first as! HeaderCell
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if collectionOfCellData[indexPath.row].cellType == 1 {
            
            return 330
        } else if collectionOfCellData[indexPath.row].cellType == 2 {
            return 200
        } else {
            return 400
        }
    }
    
}

