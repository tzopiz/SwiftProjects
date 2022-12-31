//
//  MatrixViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 31.12.2022.
//

import UIKit

class MatrixViewController: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    func setupViews(){
        changeVC()
    }
    
    func changeVC(){
        self.title = "Matrixes"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.delegate = self
    }
}
