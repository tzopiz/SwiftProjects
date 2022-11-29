//
//  NViewController.swift
//  Calcalator
//
//  Created by Дмитрий Корчагин on 29.11.2022.
//

import UIKit

class NViewController: UIViewController, UICollectionViewDelegate  {

    private lazy var collectionView: UICollectionView = {
        let cV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.backgroundColor = .white
        cV.register(NCollectionViewCell.self, forCellWithReuseIdentifier: NCollectionViewCell.identifire)
        cV.dataSource = self
        return cV
    }()
    let identifier = "Cell"
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    func setUpView(){
        addSubViews()
        createCollectionView()
    }
    func addSubViews(){
        view.addSubview(collectionView)
    }
    func createCollectionView(){
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.size.width),
            collectionView.heightAnchor.constraint(equalToConstant: view.bounds.size.height)
        ])
    }
    //MARK: - UICollectionViewDataSource

    //MARK: UICollectionViewDelegate
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // When user selects the cell
    }

    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        // When user deselects the cell
    }

}
