//
//  ViewController.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import UIKit

fileprivate struct Constants {
    static let productCellName = "ProductCell"
    static let advertCellName = "AdvertCell"
}

class ViewController: UIViewController {

    private var productCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var advertCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var searchBar = UISearchBar()
    
    private var selectedGroupIndex = 0
    
    private var menu = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProductCollection()
        createAdvertCollection()
        createSearchBar()
        view.backgroundColor = .purple
    }

    func createProductCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        productCollection = UICollectionView(
            frame: CGRect(
                x: .zero,
                y: view.bounds.height / 10,
                width: view.bounds.width,
                height: view.bounds.height - view.bounds.height / 3 - view.bounds.height / 10
            ),
            collectionViewLayout: layout
        )
        productCollection.backgroundColor = .blue
        productCollection.register(ProductCell.self, forCellWithReuseIdentifier: Constants.productCellName)
        layout.scrollDirection = .vertical
        productCollection.showsVerticalScrollIndicator = false
        productCollection.dataSource = self
        productCollection.delegate = self
        view.addSubview(productCollection)
    }
    
    func createAdvertCollection() {
        advertCollection = UICollectionView(
            frame: CGRect(
                x: .zero,
                y: view.bounds.height - view.bounds.height / 3,
                width: view.bounds.width,
                height: view.bounds.height / 3
            ),
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        advertCollection.register(AdvertCell.self, forCellWithReuseIdentifier: Constants.advertCellName)
        layout.scrollDirection = .horizontal
        advertCollection.isPagingEnabled = true
        advertCollection.backgroundColor = .red
        advertCollection.setCollectionViewLayout(layout, animated: true)
        advertCollection.showsHorizontalScrollIndicator = false
        advertCollection.dataSource = self
        advertCollection.delegate = self
        view.addSubview(advertCollection)
    }
    
    func createSearchBar() {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        searchBar = UISearchBar(
            frame: CGRect(
                x: .zero,
                y: topPadding,
                width: view.bounds.width,
                height: view.bounds.height / 10
            )
        )
        searchBar.backgroundColor = UIColor(red: 93 / 255, green: 68 / 255, blue: 211 / 255, alpha: 0.9)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Поиск"
        view.addSubview(searchBar)
    }
}

// MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == advertCollection {
//            return menu.group.count
//        }
//        if collectionView == productCollection {
//            return menu.group[selectedGroupIndex].products.count
//        }
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == advertCollection {
            guard let cell = advertCollection.dequeueReusableCell(
                withReuseIdentifier: Constants.advertCellName,
                for: indexPath
            ) as? AdvertCell
            else { return AdvertCell()}
            //let advert = Advert(image: menu.group[selectedGroupIndex].products[indexPath.item].image)
            return cell
        }
        if collectionView == productCollection {
            guard let cell = productCollection.dequeueReusableCell(
                withReuseIdentifier: Constants.productCellName,
                for: indexPath
            ) as? ProductCell
            else { return ProductCell() }
            //let product = menu.group[selectedGroupIndex].products[indexPath.item]
            //cell.createCell(product: product)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollection {
            return CGSize(width: 20, height: 30)
        }
        
        if collectionView == advertCollection {
            return CGSize(width: advertCollection.frame.width, height: advertCollection.frame.height)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == advertCollection {
            selectedGroupIndex = indexPath.row
            //productCollection.scrollToItem(at: IndexPath(index: 0), at: .left, animated: true)
            productCollection.reloadData()
        }
    }
}

// MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

