//
//  ViewController.swift
//  hw1
//
//  Created by Batyr on 09.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let images: [String] = ["FruitCard-01", "FruitCard-02", "FruitCard-03", "FruitCard-04"]
    let titles: [String] = ["Strawberry", "Banana", "Orange", "Apple"]
    private var currentImage: Int = 0
    
    
    // MARK: - Subviews
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: self.images[self.currentImage])
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = self.titles[self.currentImage]
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private lazy var buttonLeft: UIButton = {
        let buttonLeft = UIButton()
        let buttonImage = UIImage(named: "buttonLeft")
        buttonLeft.setImage(buttonImage, for: .normal)
        buttonLeft.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLeft.addAction(
            .init { [weak self] _ in
                self?.buttonLeftAction()
            },
            for: .touchUpInside
        )
    
        return buttonLeft
    }()
    
    private lazy var buttonRight: UIButton = {
        let buttonRight = UIButton()
        
        let buttonImage = UIImage(named: "buttonRight")
        buttonRight.setImage(buttonImage, for: .normal)
        buttonRight.translatesAutoresizingMaskIntoConstraints = false
        
        buttonRight.addAction(
            .init { [weak self] _ in
                self?.buttonRightAction()
            },
            for: .touchUpInside
        )
        
        return buttonRight
    }()
    
    
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = UIColor(red: 250/255, green: 235/255, blue: 170/255, alpha: 1)
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(buttonLeft)
        view.addSubview(buttonRight)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            buttonLeft.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            buttonLeft.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            buttonRight.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            buttonRight.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                ])
        
        
    }
    
    @objc
    private func buttonLeftAction() {
        print("Left")
        self.currentImage = (self.currentImage + self.images.count - 1) % self.images.count
        imageView.image = UIImage(named: self.images[self.currentImage])
        titleLabel.text = self.titles[self.currentImage]
    }
       
    @objc
    private func buttonRightAction() {
        print("Right")
        self.currentImage = (self.currentImage + 1) % self.images.count
        imageView.image = UIImage(named: self.images[self.currentImage])
        titleLabel.text = self.titles[self.currentImage]
    }


}

