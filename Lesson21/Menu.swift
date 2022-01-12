//
//  Menu.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import Foundation
import UIKit

struct Group {
    var name: String
    var products: [Product]
}

struct Advert {
    var image: UIImage
}

struct Product {
    var name: String
    var price: Float
    var image: UIImage
}

class Menu {
    var group = [Group]()
    
    init() {
        setup()
    }
    
    func setup() {
        let p1 = Product(name: "Майка Крутая", price: 20.4, image: UIImage(named: "product1") ?? .init())
        let p2 = Product(name: "Кофта крутая", price: 27.5, image: UIImage(named: "product2") ?? .init())
        let p3 = Product(name: "Майка так себе", price: 40, image: UIImage(named: "product3") ?? .init())
        let p4 = Product(name: "Майка так бомба", price: 10, image: UIImage(named: "product4") ?? .init())
        let tShits = [p1, p2, p3]
        let hoodies = [p4, p1, p3]
        
        group.append(Group(name: "Майки", products: tShits))
        group.append(Group(name: "Кофты", products: hoodies))
    }
}
