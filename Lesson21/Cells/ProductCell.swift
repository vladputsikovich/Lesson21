//
//  ProductCell.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import UIKit

fileprivate struct Constants {
    static let nameLabelFont = "Helvetica Neue"
    static let priceLabelFont = "Helvetica-Bold"
    static let nameLabelFontSize: CGFloat = 14
    static let priceLabelFontSize: CGFloat  = 16
    static let radiusImage: CGFloat = 10
    static let imageViewMultiplier: CGFloat = 0.8
    static let nameLabelMultiplier: CGFloat = 0.1
    static let priceLabelMultiplier: CGFloat = 0.1
}

class ProductCell: UICollectionViewCell {
    
    private let imageView = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
        createLabelName()
        createLabelPrice()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createCell() {
        imageView.frame = CGRect(
            x: .zero,
            y: .zero,
            width: self.frame.width,
            height: self.frame.height * Constants.imageViewMultiplier
        )
        imageView.layer.cornerRadius = Constants.radiusImage
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }
    
    private func createLabelName() {
        nameLabel.frame = CGRect(
            x: .zero,
            y: imageView.frame.maxY,
            width: self.frame.width,
            height: self.frame.height * Constants.nameLabelMultiplier
        )
        nameLabel.font = UIFont(
            name: Constants.nameLabelFont,
            size: Constants.nameLabelFontSize
        )
        addSubview(nameLabel)
    }
    
    private func createLabelPrice() {
        priceLabel.frame = CGRect(
            x: .zero,
            y: nameLabel.frame.maxY,
            width: self.frame.width,
            height: self.frame.height * Constants.priceLabelMultiplier
        )
        priceLabel.font = UIFont(
            name: Constants.priceLabelFont,
            size: Constants.priceLabelFontSize
        )
        addSubview(priceLabel)
    }
    
    func configOf(product: Product) {
        imageView.image = product.image
        nameLabel.text = product.name
        priceLabel.text = "\(product.price)"
    }
}
