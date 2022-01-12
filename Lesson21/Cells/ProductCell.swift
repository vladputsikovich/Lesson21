//
//  ProductCell.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell(rect: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell(rect: CGRect) {
        image.image = UIImage(named: "product1")
        image.frame = frame
        addSubview(image)
    }
}
