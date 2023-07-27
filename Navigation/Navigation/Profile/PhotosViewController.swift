//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Roman Geraskin on 21.07.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    let collection: UICollectionView = {
        let spacing = 4.0
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / 3.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / 3.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "photosCollectionViewCell")
        return collection
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Photos Gallery"
        collection.dataSource = self
        setupConstraint()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    func setupConstraint() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4)
        ])
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.fillCell(picture: Data.photoArray[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Data.photoArray.count
    }
}
