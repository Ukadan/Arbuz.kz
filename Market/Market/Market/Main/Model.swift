//
//  Model.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation

enum CellModel {
    case collectionView(models: [CollectionTableCellModel])
    case product(models: [ProductModel])
    case button(models: [ButtonModel])
}

struct CollectionTableCellModel {
    let imageName: String
}

struct ProductModel {
    let title: String
    let imagename: String
    let count: String
    let kil: String? 
}

struct ButtonModel {
    let title: String
    let imagename: String
    let count: String
    let kil: String? 
}
