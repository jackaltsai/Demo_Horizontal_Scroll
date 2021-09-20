//
//  ViewController.swift
//  Demo_Horizontal_Scroll
//
//  Created by 蔡忠翊 on 2021/9/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
    }
    
    // 水平捲動
    func generateLayout() -> UICollectionViewLayout {
        let space: Double = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = space
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: space, bottom: 0, trailing: space)
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        // UICollectionViewCompositionalLayoutConfiguration 的 scrollDirection 設成 horizontal
        configuration.scrollDirection = .horizontal
        return UICollectionViewCompositionalLayout(section: section, configuration: configuration)
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "Image\(indexPath.item + 1)")
        cell.label.text = "Image\(indexPath.item + 1)"
        return cell
    }
    
    
}
