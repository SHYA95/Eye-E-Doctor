//
//  EyeScanningViewController.swift
//  E-Eye Doctor
//
//  Created by Shrouk Yasser on 06/03/2023.
//
//
//

import UIKit

class EyeScanningViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let cellReuseIdentifier = "MyCell"
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please select which method using to scan your eye.\nSecond Line"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.33, green: 0.71, blue: 0.71, alpha: 1.00)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
        // Add header label to view hierarchy
        view.addSubview(headerLabel)
        
        // Set header label constraints
        headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        // Configure the cell with an image and a button
        if indexPath.row == 0 {
            cell.imageView.image = UIImage(named: "2")
            cell.button.setTitle("Upload photo", for: .normal)
        } else {
            cell.imageView.image = UIImage(named: "1")
            cell.button.setTitle("Take a photo", for: .normal)
        }
        cell.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 48) / 2 // Subtract 16px from leading and trailing edges and 16px spacing between cells
        let height: CGFloat = 300 // Set the cell height to 200
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: - Actions
    
    @objc func buttonTapped(_ sender: UIButton) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        let titleLabel = UILabel()
        titleLabel.text = sender.title(for: .normal)
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1) // set button color to #53B4B6
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "comic sans ms", size:12) // set font to Comic Sans MS with size 14
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        // Add green border with corner radius to cell
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor(red: 83/255, green: 180/255, blue: 182/255, alpha: 1).cgColor
        contentView.layer.cornerRadius = 10
        
        
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalToConstant: contentView.frame.height * 0.8),
            
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
