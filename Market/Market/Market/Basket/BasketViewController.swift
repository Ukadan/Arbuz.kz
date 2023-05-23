//
//  BasketViewController.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit

final class BasketViewController: ViewController, BasketTableViewCellProtocol {
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    private lazy var checkoutButton = UIButton()
    
    private let model = BasketModel.setupMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Корзина"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupConstraints()
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: "BasketTableViewCell")
    }
    
    private func setupConstraints() {
        tableView.backgroundColor = .white
        view.addSubViews(tableView, checkoutButton)
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            checkoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            checkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            checkoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupView() {
        checkoutButton.setTitle("Оформить заказ", for: .normal)
        checkoutButton.layer.cornerRadius = 20
        checkoutButton.clipsToBounds = true
        checkoutButton.backgroundColor = .systemGreen
        checkoutButton.addTarget(self, action: #selector(tapAction), for: .touchDown)
    }
    
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
              alertController.addAction(okAction)
              present(alertController, animated: true, completion: nil)
    }
    
    @objc private func tapAction() {
        let vc = CheckoutViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as? BasketTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        
        cell.configure(with: model)
        cell.alertDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        }
    }
    
