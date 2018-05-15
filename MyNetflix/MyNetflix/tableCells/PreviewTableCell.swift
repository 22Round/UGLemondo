//
//  PreviewTableCell.swift
//  MyNetflix
//
//  Created by Vakhtangi Beridze on 5/10/18.
//  Copyright © 2018 22Round. All rights reserved.
//

import UIKit

class PreviewTableCell: TableBaseCell, TableViewCellProtocol, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    let cellId = "cell"
    
    var data:MovieData?{
        didSet{
            
        }
    }
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
        
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .horizontal
        f.itemSize = CGSize(width: 100, height: 100)
        f.minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        f.minimumLineSpacing = 5
        return f
    }()
    
    lazy var collection: UICollectionView = {
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(PreviewFilmsPosterCell.self, forCellWithReuseIdentifier: cellId)
        cv.backgroundColor = .black
        return cv
    }()
    
    override func setupViews() {
        
        super.setupViews()
        
        self.backgroundColor = .black

        nameLabel.text = "Preview"
        self.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        self.addSubview(collection)
        
        collection.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        collection.rightAnchor.constraint(equalTo: self.rightAnchor)
        collection.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10).isActive = true
        collection.heightAnchor.constraint(equalToConstant: 100).isActive = true
        collection.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
}

class PreviewFilmsPosterCell: UICollectionViewCell {
    
    let profileImageButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.setImage(UIImage(named: "profile_batman"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func addViews(){
        
        backgroundColor = UIColor.clear
        
        addSubview(profileImageButton)

        profileImageButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

