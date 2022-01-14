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
    static let advertBottomCellName = "AdvertBottomCell"
    static let searchBarPlaceHolder = "Поиск"
    static let minimumLineSpacing: CGFloat = 10
}

class ViewController: UIViewController {

    private var productCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var advertCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var advertBottomCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    private var searchBar = UISearchBar()
    
    private var pageContol = UIPageControl()
    
    private var selectedGroupIndex = 0
    
    private var searchProducts = [Product]()
    
    private var menu = Menu()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        createAdvertCollection()
        createPageControl()
        createProductCollection()
        createBottomAdvertCollection()
        print(UIDevice.current.name)
    }
    
    func createSearchBar() {
        let window = UIApplication.shared.windows.first
        let topPadding = window?.safeAreaInsets.top ?? 0
        
        searchBar = UISearchBar(
            frame: CGRect(
                x: .zero,
                y: topPadding,
                width: view.bounds.width,
                height: 50
            )
        )
        searchBar.backgroundColor = .purple
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = Constants.searchBarPlaceHolder
        searchBar.delegate = self
        view.addSubview(searchBar)
    }
    
    func createAdvertCollection() {
        advertCollection = UICollectionView(
            frame: CGRect(
                x: .zero,
                y: searchBar.frame.maxY,
                width: view.bounds.width,
                height: view.bounds.height / 7
            ),
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        advertCollection.register(AdvertCell.self, forCellWithReuseIdentifier: Constants.advertCellName)
        layout.scrollDirection = .horizontal
        advertCollection.isPagingEnabled = true
        advertCollection.setCollectionViewLayout(layout, animated: true)
        advertCollection.showsHorizontalScrollIndicator = false
        advertCollection.dataSource = self
        advertCollection.delegate = self
        view.addSubview(advertCollection)
    }
    
    func createPageControl() {
        pageContol = UIPageControl(
            frame: CGRect(
                x: .zero,
                y: advertCollection.frame.maxY - 40,
                width: view.frame.width,
                height: 30
            )
        )
        pageContol.numberOfPages = menu.advertsTop.count
        pageContol.currentPage = 0
        pageContol.tintColor = .gray
        pageContol.pageIndicatorTintColor = .white
        pageContol.currentPageIndicatorTintColor = .black
        view.addSubview(pageContol)
    }

    func createProductCollection() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        productCollection = UICollectionView(
            frame: CGRect(
                x: 10,
                y: advertCollection.frame.maxY,
                width: view.bounds.width - 20,
                height: view.bounds.height / 1.8
            ),
            collectionViewLayout: layout
        )
        productCollection.register(ProductCell.self, forCellWithReuseIdentifier: Constants.productCellName)
        layout.scrollDirection = .vertical
        productCollection.showsVerticalScrollIndicator = false
        productCollection.dataSource = self
        productCollection.delegate = self
        view.addSubview(productCollection)
    }
    
    func createBottomAdvertCollection() {
        let window = UIApplication.shared.windows.first
        let bottomPadding = window?.safeAreaInsets.bottom ?? 0
        advertBottomCollection = UICollectionView(
            frame: CGRect(
                x: .zero,
                y: productCollection.frame.maxY,
                width: view.bounds.width,
                height: view.bounds.height - productCollection.frame.maxY - bottomPadding
            ),
            collectionViewLayout: UICollectionViewFlowLayout.init()
        )
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        advertBottomCollection.register(AdvertBottomCell.self, forCellWithReuseIdentifier: Constants.advertBottomCellName)
        layout.scrollDirection = .horizontal
        advertBottomCollection.isPagingEnabled = true
        advertBottomCollection.setCollectionViewLayout(layout, animated: true)
        advertBottomCollection.showsHorizontalScrollIndicator = false
        advertBottomCollection.dataSource = self
        advertBottomCollection.delegate = self
        view.addSubview(advertBottomCollection)
    }
}

// MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == advertCollection {
            return menu.advertsTop.count
        }
        if collectionView == productCollection {
            return searchProducts.isEmpty ? menu.products.count : searchProducts.count
        }
        if collectionView == advertBottomCollection {
            return menu.advertsBottom.count
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == advertCollection {
            guard let cell = advertCollection.dequeueReusableCell(
                withReuseIdentifier: Constants.advertCellName,
                for: indexPath
            ) as? AdvertCell
            else { return AdvertCell()}
            let advert = menu.advertsTop[indexPath.item]
            cell.configOf(advert: advert)
            return cell
        }
        if collectionView == advertBottomCollection {
            guard let cell = advertBottomCollection.dequeueReusableCell(
                withReuseIdentifier: Constants.advertBottomCellName,
                for: indexPath
            ) as? AdvertBottomCell
            else { return AdvertBottomCell()}
            let advert = menu.advertsBottom[indexPath.item]
            cell.configOf(advert: advert)
            return cell
        }
        if collectionView == productCollection {
            guard let cell = productCollection.dequeueReusableCell(
                withReuseIdentifier: Constants.productCellName,
                for: indexPath
            ) as? ProductCell
            else { return ProductCell() }
            let product = searchProducts.isEmpty ? menu.products[indexPath.item] : searchProducts[indexPath.item]
            cell.configOf(product: product)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in advertCollection.visibleCells {
            guard let indexPath = advertCollection.indexPath(for: cell) else { return }
            pageContol.currentPage = indexPath[1]
        }
    }
}



// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollection {
            return CGSize(width: productCollection.frame.width / 3.3, height: productCollection.frame.height / 2)
        }
        
        if collectionView == advertCollection {
            return CGSize(width: advertCollection.frame.width, height: advertCollection.frame.height)
        }
        
        if collectionView == advertBottomCollection {
            return CGSize(width: advertBottomCollection.frame.width, height: advertBottomCollection.frame.height)
        }
        return CGSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.minimumLineSpacing
    }
}

// MARK: UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}

// MARK: UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchProducts = []
        if searchText.isEmpty {
            searchProducts = menu.products
        } else {
            menu.products.forEach { product in
                if product.name.contains(searchText.lowercased()) {
                    searchProducts.append(product)
                }
            }
        }
        productCollection.reloadData()
    }
}
