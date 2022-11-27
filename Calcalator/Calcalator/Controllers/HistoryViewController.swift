//
//  HistoryViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 25.11.2022.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var historyTextView = UITextView.createBigTextView()
    var sizes = Sizes()
    let userDefaults = UserDefaults.standard
    var f = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        historyTextView.text = userDefaults.string(forKey: "history") ?? ""
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        UserDefaults.standard.set(historyTextView.text, forKey: "1")
    }
    // MARK: -methods
    func setUpView(){
        changeNavVC()
        sizes = Sizes(view.bounds.size.width, sizeH: view.bounds.size.height)
        addSubViews()
        createHistoryTextViewConstraint()
    }
    func addSubViews(){
        view.addSubview(historyTextView)
    }
    func createHistoryTextViewConstraint(){
        if let text = userDefaults.string(forKey: "text"){
            historyTextView.text += text
            let t = (userDefaults.string(forKey: "history") ?? "") + text
            UserDefaults.standard.set(t, forKey: "history")
        }
        userDefaults.removeObject(forKey: "text")
        NSLayoutConstraint.activate([
            historyTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            
            historyTextView.widthAnchor.constraint(equalTo: view.widthAnchor),
            historyTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    func changeNavVC(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
    }
}
 