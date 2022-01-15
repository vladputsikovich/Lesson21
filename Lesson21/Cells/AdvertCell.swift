//
//  AdvertCell.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import UIKit

fileprivate struct Constants {
    static let radiusImage: CGFloat = 10
}

class AdvertCell: UICollectionViewCell {
    
    var advert: Advert?
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCell() {
        imageView.frame = CGRect(x: 10, y: 10, width: self.frame.width - 20, height: self.frame.height - 20)
        imageView.layer.cornerRadius = Constants.radiusImage
        imageView.clipsToBounds = true
        addSubview(imageView)
    }
    
    func configOf(advert: Advert) {
        imageView.image = advert.image
        imageView.contentMode = .scaleToFill
    }
}
