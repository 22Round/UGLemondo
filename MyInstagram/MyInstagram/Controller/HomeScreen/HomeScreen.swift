//
//  ViewController.swift
//  MyInstagram
//
//  Created by c0mrade on 4/12/18.
//  Copyright © 2018 c0mrade. All rights reserved.
//
// https://github.com/FolioReader/FolioReaderKit
import UIKit

// MARK: - HomeScreenCell

class HeaderCollectionCell:UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 2
    }
    
}


class HomeScreenCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var imgView: UIImageView!
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblDescription: UILabel!
    @IBOutlet fileprivate weak var customContent: UIView!
    
    @IBOutlet weak var topCollectionView: UICollectionView!
    
    
    // MARK: - View LifeCycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        customContent.layer.cornerRadius = 8
        customContent.clipsToBounds = false
        customContent.layer.masksToBounds = false
        
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        customContent.layer.shadowColor = UIColor.black.cgColor
        customContent.layer.shadowOffset = CGSize(width: 0, height: -5)
        customContent.layer.shadowOpacity = 0.03
        customContent.layer.shadowRadius = 10
        
    }
    
}

class HomeScreen: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: - Properties
    fileprivate var dataSource = [MovieObject]()
    private var imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["test_0", "test_1", "test_2", "test_3", "test_4"]
        
        fetchData()
    }
    
    private func fetchData () {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.loadFirstElements()
            
            DispatchQueue.main.async {
                self?.tableView.delegate = self
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
                
                DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                    self?.dummyDataGeneratorForFunAndOnlyTodayAndNeverAgain()
                    
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    private func loadFirstElements () {
        for i in 0..<20 {
            
            let object = MovieObject()
            object.description = "Moulin Rouge is a cabaret in Paris, France. The original house, which burned down in 1915, was co-founded in 1889 by Charles Zidler and Joseph Oller, who also owned the Paris Olympia."
            object.image = UIImage(named: "test_\(Int(arc4random_uniform(8)))")
            object.name = "\(i) Moulin Rouge - Cabaret in Paris"
            
            self.dataSource.append(object)
        }
    }
    
    private func dummyDataGeneratorForFunAndOnlyTodayAndNeverAgain () {
        for i in 0..<200000 {
            
            let object = MovieObject()
            object.description = "Moulin Rouge is a cabaret in Paris, France. The original house, which burned down in 1915, was co-founded in 1889 by Charles Zidler and Joseph Oller, who also owned the Paris Olympia."
            object.image = UIImage(named: "test_\(Int(arc4random_uniform(8)))")
            object.name = "\(i) Moulin Rouge - Cabaret in Paris"
            
            self.dataSource.append(object)
        }
    }
}

// MARK: - UITableViewDelegate - UITableViewDataSource
extension HomeScreen: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeScreenCell", for: indexPath) as! HomeScreenCell
        
        let object = dataSource[indexPath.row]
        
        cell.imgView.image = object.image
        //        cell.lblTitle.text = object.name
        //        cell.lblDescription.text = object.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailScreen") as! DetailScreen
        vc.dataObject = self.dataSource[indexPath.row]
//        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thumbCellId", for: indexPath) as! HeaderCollectionCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "StoryScreen") as! StoryScreen
        present(vc, animated: true, completion: nil)
    }
}

//// MARK: - DetailScreenDelegate
//extension HomeScreen: DetailScreenDelegate {
//    func showMeSomeData() {
//        let alert = UIAlertController(title: "Alert",
//                                      message: "Parent got notification from child",
//                                      preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//    }
//}
