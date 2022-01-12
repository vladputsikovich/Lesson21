//
//  AdvertCell.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import UIKit

class AdvertCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "product1")
        imageView.backgroundColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell() {
        image.frame = self.frame
        addSubview(image)
    }
}
