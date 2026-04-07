//
//  BaseViewController.swift
//  Cinecast
//
//  Created by Anand Mahajan on 07/04/26.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
    }
    
    private func setupBackgroundImage() {
        // Avoid duplicate setup
        guard backgroundImageView == nil else { return }
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(imageView, at: 0) // send to back
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        self.backgroundImageView = imageView
    }
    
    func designBtn(btn: UIButton, title: String = "", titleColor: UIColor = UICOLOR_WHITE, backgroundColor: UIColor = UICOLOR_BUTTON){
        btn.setTitle(title, for: .normal)
        btn.setTitle(title, for: .highlighted)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setTitleColor(titleColor, for: .highlighted)
        btn.backgroundColor = backgroundColor
        btn.titleLabel?.font = FONT_RobotoMonoBold_H16
        btn.layer.cornerRadius = 12.0
    }
}
