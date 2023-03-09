//
//  InstViewController.swift
//  E-Eye Doctor
//
//  Created by Shrouk Yasser on 09/03/2023.
//

import UIKit

class InstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        //        navigationItem.title = "Instructions"
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        ]
        navigationItem.title = "Instructions"
        
        
        // Create the first label
        let label1 = UILabel()
        label1.text = "* This scan involves taking a shot of your eye using the back camera of your phone with the help of a flash."
        label1.numberOfLines = 0
        
        label1.font = .boldSystemFont(ofSize: 24)
        label1.textColor = UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        
        // Create the first empty circle image
        let image1 = UIImage(named: "circle")
        let imageView1 = UIImageView(image: image1)
        imageView1.contentMode = .scaleAspectFit
        
        // Add the image and label to a stack view
        let stackView1 = UIStackView(arrangedSubviews: [imageView1, label1])
        stackView1.axis = .horizontal
        stackView1.spacing = 20
        
        // Create the second label
        let label2 = UILabel()
        label2.text = "* Make sure that someone else is taking this shot."
        label2.numberOfLines = 0
        label2.font = .boldSystemFont(ofSize: 24)
        label2.textColor = UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        
        // Create the second empty circle image
        let image2 = UIImage(named: "circle")
        let imageView2 = UIImageView(image: image2)
        imageView2.contentMode = .scaleAspectFit
        
        // Add the image and label to a stack view
        let stackView2 = UIStackView(arrangedSubviews: [imageView2, label2])
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        
        // Create the third label
        let label3 = UILabel()
        label3.text = "* Make sure you are in a well-light room."
        label3.numberOfLines = 0
        label3.font = .boldSystemFont(ofSize: 24)
        label3.textColor = UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        
        // Create the third empty circle image
        let image3 = UIImage(named: "circle")
        let imageView3 = UIImageView(image: image3)
        imageView3.contentMode = .scaleAspectFit
        
        // Add the image and label to a stack view
        let stackView3 = UIStackView(arrangedSubviews: [imageView3, label3])
        stackView3.axis = .horizontal
        stackView3.spacing = 20
        
        // Create a vertical stack view to hold all the stack views
        let mainStackView = UIStackView(arrangedSubviews: [stackView1, stackView2, stackView3])
        mainStackView.axis = .vertical
        mainStackView.spacing = 36
        mainStackView.alignment = .leading
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the stack view to the view controller's view
        view.addSubview(mainStackView)
        
        // Set constraints for the stack view
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        // Create the skip button
        let skipButton = UIButton()
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitle("Skip", for: .normal)
        skipButton.backgroundColor = UIColor(red: 0.325, green: 0.706, blue: 0.714, alpha: 1)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.layer.cornerRadius = 10
        view.addSubview(skipButton)
        
        // Set the constraints for the skip button
        NSLayoutConstraint.activate([
            // Add constraints for the skip button
            skipButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            skipButton.widthAnchor.constraint(equalToConstant: 135),
            skipButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    

    // Function to handle skip button tap
        @objc func skipButtonTapped() {
            // Handle skip button tap here
            
        }
    

}
