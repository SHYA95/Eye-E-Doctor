//
//  CollectionViewTableViewCell.swift
//  Netflix Clone
//
//  Created by Shrouk Yasser on 06/02/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    
    
    private let CollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(140, 200)
        layout.scrollDirection = .horizontal
        
        let CollectionView  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        CollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
             
        return CollectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(CollectionView)
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        CollectionView.frame = contentView.bounds
    }
    
    }

extension CollectionViewTableViewCell :UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
}
