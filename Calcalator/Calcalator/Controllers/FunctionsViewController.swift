//
//  FunctionsViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 25.11.2022.
//

import UIKit

class FunctionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    
    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let list = ["ℚ", "ℤ","Differential", "Integrales", "Matrixes", "Free numbers and vectors", "Solving SLAE", "Literature", "Trigonometric Functions", "Hyperbolic Functions"]
    let identifier = "cell"
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
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let number = list[indexPath.row]
        cell.textLabel?.text = number
        cell.accessoryType = .disclosureIndicator
        cell.separatorInset = UIEdgeInsets(top: sizes.sizeSpace, left: sizes.sizeSpace, bottom: sizes.sizeSpace, right: sizes.sizeSpace)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "pushSeque" {
//            // This segue is pushing a detailed view controller.
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                segue.destination.title = list[indexPath.row]
//            }
//            
//            // You choose not to have a large title for the destination view controller.
//            segue.destination.navigationItem.largeTitleDisplayMode = .never
//        } else {
//            // This segue is popping you back up the navigation stack.
//        }
//    }
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
}
