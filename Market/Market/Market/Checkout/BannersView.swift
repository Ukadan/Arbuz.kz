//
//  DayView.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import UIKit
final class BannersView: UIView {
 
    var scrollView: UIScrollView!

    convenience init(labelName: String, labelNameTwo: String, labelNameThree: String) {
        self.init()
        
        // Create UIScrollView and set its size and position
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 357, height: 20))
        scrollView.contentSize = CGSize(width: 1000, height: 200)
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        let itemWidth: CGFloat = 120
        let itemHeight: CGFloat = 20
        let itemSpacing: CGFloat = 20
        var xOffset: CGFloat = 0

     
        let itemView1 = UIView(frame: CGRect(x: xOffset, y: 0, width: itemWidth, height: itemHeight))
        itemView1.layer.cornerRadius = 10
        itemView1.clipsToBounds = true
        itemView1.backgroundColor = .systemGray5

        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        label1.textAlignment = .center
        label1.font = .systemFont(ofSize: 15)
        label1.textColor = UIColor.white
        label1.text = "\(labelName)"

        itemView1.addSubview(label1)
        scrollView.addSubview(itemView1)

        xOffset += itemWidth + itemSpacing

        
        let itemView2 = UIView(frame: CGRect(x: xOffset, y: 0, width: itemWidth, height: itemHeight))
        itemView2.layer.cornerRadius = 10
        itemView2.clipsToBounds = true
        itemView2.backgroundColor = .systemGray5

        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        label2.textAlignment = .center
        label2.font = .systemFont(ofSize: 15)
        label2.textColor = UIColor.white
        label2.text = "\(labelNameTwo)"

        itemView2.addSubview(label2)
        scrollView.addSubview(itemView2)

        xOffset += itemWidth + itemSpacing

     
        let itemView3 = UIView(frame: CGRect(x: xOffset, y: 0, width: itemWidth, height: itemHeight))
        itemView3.layer.cornerRadius = 10
        itemView3.clipsToBounds = true
        itemView3.backgroundColor = .systemGray5

        let label3 = UILabel(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        label3.textAlignment = .center
        label3.font = .systemFont(ofSize: 15)
        label3.textColor = UIColor.white
        label3.text = "\(labelNameThree)"

        itemView3.addSubview(label3)
        scrollView.addSubview(itemView3)

        xOffset += itemWidth + itemSpacing

        scrollView.contentSize = CGSize(width: xOffset, height: itemHeight)
        self.addSubview(scrollView)
    }

}
