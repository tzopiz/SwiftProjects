//
//  FunctionsViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 25.11.2022.
//

import UIKit

class FunctionsViewController: UIViewController, UITableViewDelegate{
    
    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let dataSource = MenuDataSource()
    let identifier = "Cell"
    var sizes = Sizes()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        sizes = Sizes(view.bounds.size.width, sizeH: view.bounds.size.height)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        setUpViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // MARK: -myMethods
    func setUpViews(){
        changeNavVC()
        addSubViews()
        createTableView()
    }
    func addSubViews(){
        view.addSubview(tableView)
    }
    func createTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = dataSource
        createTableVieConstraint()
    }
    func createTableVieConstraint(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
            
        ])
    }
    // MARK: -DataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // when u select the row
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: -navController
    func changeNavVC(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.placeholderText] // With a red background, make the title more readable.
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "Menu"
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        let selectionColor = UIView() as UIView
        selectionColor.layer.borderWidth = 1
        selectionColor.layer.borderColor = UIColor.systemGray5.cgColor
        selectionColor.backgroundColor = UIColor.systemGray5
        cell.selectedBackgroundView = selectionColor
    }
}
