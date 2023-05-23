//
//  MainViewControler.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit

final class MainViewControler: ViewController {
    
    private lazy var searchController: UISearchController = UISearchController(searchResultsController: nil)
    private  lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Главное"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupView()
        setupConstraints()
        setupModel()
        tableView.delegate = self
        tableView.dataSource = self
    

        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        tableView.register(MainProductTableViewCell.self, forCellReuseIdentifier: "MainProductTableView")
        tableView.register(BottonTableCell.self, forCellReuseIdentifier: "BottonTableCell")
    }
    
    private var models = [CellModel]()
    
    private func setupModel() {
        models.append(.collectionView(models: [
            CollectionTableCellModel(imageName: "bingo_pizza_21"),
            CollectionTableCellModel(imageName: "food01"),
            CollectionTableCellModel(imageName: "pitstsa"),
        ]))
        
        models.append(.product(models: [
            ProductModel(title: "Сметана домашняя", imagename: "product1", count: "200T", kil: "0"),
            ProductModel(title: "Малина деревенская", imagename: "product2", count: "150T", kil: "0.0"),
            ProductModel(title: "Клубника", imagename: "Снимок экрана 2023-05-19 в 15.54 1", count: "700T", kil: "0.0"),
            ProductModel(title: "Грушевый сок", imagename: "sok", count: "300T", kil: "0")
        ]))
        
        models.append(.button(models: [
            ButtonModel(title: "Грушевый сок", imagename: "sok", count: "300T", kil: "0"),
            ButtonModel(title: "Клубника", imagename: "Снимок экрана 2023-05-19 в 15.54 1", count: "700T", kil: "0.0кг"),
            ButtonModel(title: "Малина деревенская", imagename: "product2", count: "150.0T", kil: "0.0кг"),
            ButtonModel(title: "Сметана домашняя", imagename: "product1", count: "200T", kil: "0"),
            ButtonModel(title: "Малина деревенская", imagename: "product2", count: "150.0T", kil: "0.0кг")
        ]))
    }
    
    private func setupView(){
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.enablesReturnKeyAutomatically = true
        navigationItem.searchController = searchController
    }
    
    private func setupConstraints() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubViews(tableView)
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewControler: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text, !searchText.isEmpty else {
            return
        }
        search(for: searchText)
    }
    
    func search(for searchText: String) {
        print(searchText)
    }
}

extension MainViewControler: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count // Возвращаем количество секций (ячеек)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .collectionView( _): return 1
        case .product( _): return 1
        case .button(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch models[indexPath.section] {
        case .collectionView(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
            cell.configure(with: model)
            return cell
        case .product(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainProductTableView", for: indexPath) as? MainProductTableViewCell else {return UITableViewCell()}
            cell.configure(with: model)
            return cell
        case .button(models: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BottonTableCell", for: indexPath) as? BottonTableCell else {return UITableViewCell()}
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .collectionView( _): return 200
        case .product(_): return 180
        case .button(_): return 180
        }
    }
}

extension UICollectionView {
    
    convenience init(frame: CGRect, scrolling: UICollectionView.ScrollDirection, spasing: CGFloat, sectionSpasing: UIEdgeInsets! = nil) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrolling
        layout.minimumLineSpacing = spasing
        layout.minimumInteritemSpacing = spasing
        layout.sectionInset = sectionSpasing ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }

}


