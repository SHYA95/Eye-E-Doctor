//
//  TakephotoViewController.swift
//  E-Eye Doctor
//
//  Created by Shrouk Yasser on 09/03/2023.
//

import UIKit

class TakephotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        ]
        navigationItem.title = "Take Photo"
        
    }

}
