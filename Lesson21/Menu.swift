//
//  Menu.swift
//  Lesson21
//
//  Created by Владислав Пуцыкович on 10.01.22.
//

import Foundation
import UIKit

struct Advert {
    var image: UIImage
}

struct Product {
    var name: String
    var price: Float
    var image: UIImage
}

class Menu {
    var products = [Product]()
    var advertsTop = [Advert]()
    var advertsBottom = [Advert]()
    
    init() {
        setup()
    }
    
    func setup() {
        let p1 = Product(
            name: "Майка Крутая",
            price: 20.4,
            image: UIImage(named: "product1") ?? .init()
        )
        let p2 = Product(
            name: "Кофта крутая",
            price: 27.5,
            image: UIImage(named: "product2") ?? .init()
        )
        let p3 = Product(
            name: "Майка так себе",
            price: 40,
            image: UIImage(named: "product3") ?? .init()
        )
        let p4 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product4") ?? .init()
        )
        let p5 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product1") ?? .init()
        )
        let p6 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product2") ?? .init()
        )
        let p7 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product2") ?? .init()
        )
        let p8 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product1") ?? .init()
        )
        let p9 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product4") ?? .init()
        )
        let p10 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product2") ?? .init()
        )
        let p11 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product1") ?? .init()
        )
        let p12 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product4") ?? .init()
        )
        let p13 = Product(
            name: "Майка так бомба",
            price: 10,
            image: UIImage(named: "product2") ?? .init()
        )
        
        let advertTop1 = Advert(image: UIImage(named: "advertTop1") ?? .init())
        let advertTop2 = Advert(image: UIImage(named: "advertTop2") ?? .init())
        
        let advertBot1 = Advert(image: UIImage(named: "advertBot1") ?? .init())
        let advertBot2 = Advert(image: UIImage(named: "advertBot2") ?? .init())
        
        products = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13]
        advertsTop = [advertTop1, advertTop2]
        advertsBottom = [advertBot1, advertBot2]
    }
}
