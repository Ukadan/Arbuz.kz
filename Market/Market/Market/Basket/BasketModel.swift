//
//  BasketModel.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation

struct BasketModel {
    let nameProduct: String
    let countProduct: String
    let image: String?
    let price: String
    
    static func setupMenu() -> [BasketModel] {
        return [
            BasketModel(nameProduct: "Сметана домашняя", countProduct: "4", image: "product1", price: "100"),
            BasketModel(nameProduct: "Малина деревенская", countProduct: "1.0", image: "product2", price: "230"),
            BasketModel(nameProduct: "Клубника", countProduct: "1.0", image: "Снимок экрана 2023-05-19 в 15.54 1", price: "300"),
            BasketModel(nameProduct: "Грушевый сок", countProduct: "1.0", image: "sok", price: "400")
        ]
    }
}
