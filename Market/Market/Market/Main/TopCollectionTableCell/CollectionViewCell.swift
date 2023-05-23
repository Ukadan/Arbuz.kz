//
//  CollectionViewCell.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit
 class CollectionViewCell: UICollectionViewCell {
    
     lazy var imageCell : UIImageView = {
        let image = UIImageView()
         
         return image
     }()
    
         override init(frame: CGRect) {
             super.init(frame: frame)
             self.setupConstraints()
            
             
         }
         
         required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
         
         private func setupConstraints() {
              let view = UIView()
             view.backgroundColor = .yellow
             view.layer.cornerRadius = 20
             view.clipsToBounds = true
             contentView.addSubViews(view)
             view.addSubViews(imageCell)
             contentView.layer.cornerRadius = 20
             contentView.clipsToBounds = true
             
             NSLayoutConstraint.activate([
                
                view.topAnchor.constraint(equalTo: contentView.topAnchor),
                view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -100),
                view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 100),
                view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                
                imageCell.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
                imageCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                imageCell.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                imageCell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
             ])
             
         }
         
      func configure(_ image: CollectionTableCellModel) {
          imageCell.image = UIImage(named: image.imageName)
         }
     }
