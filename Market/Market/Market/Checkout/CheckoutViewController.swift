//
//  CheckoutViewController.swift
//  Market
//
//  Created by macbook on 21.05.2023.
//

import Foundation
import UIKit
class CheckoutViewController: ViewController {
    
    private let scrollView = UIScrollView()
    //адрес доставки
    private let addressView = DeliveryAddressView()
    private lazy var addressBackground = CustomBackground(labelName: "Адрес доставки")
    //дни недели
    private lazy var weekBackground = CustomBackground(labelName: "День доставки")
    private let readmiView = ReminderView()
    //время доставки
    private lazy var timeBackground1 = CustomBackground(labelName: "Время доставки")
    var banerView = BannersView(labelName: "07:00 - 09:00", labelNameTwo: "08:00 - 10:00", labelNameThree: "09:00 - 11:00")
    //дни подписки
    private lazy var subscriptionPeriodBackground = CustomBackground(labelName: "Срок подписки")
    var banerPeriodView = BannersView(labelName: "23 мая", labelNameTwo: "24 мая", labelNameThree: "25 мая")
    //контактная информация
    private lazy var contactView = ContactView(labelName: "Контактная информация", textContent1: " Контактная информация", textContent2: " Телефон", textContent3: " Коментарий")
    //оплата
    private lazy var paymentBackground = CustomBackground(labelName: "Оплата")
    private lazy var payment = PaymentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Оформить заказ"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupConstraint()
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupConstraint() {
        addressView.deliveryButton.addTarget(self, action: #selector(tapAction), for: .touchDown)
        payment.deliveryButton.addTarget(self, action: #selector(tapActionPay), for: .touchDown)
        
        let stackView = UIStackView(axis: .vertical, distribution: .fill, spacing: 38, views: [addressBackground, weekBackground, timeBackground1, subscriptionPeriodBackground, contactView, paymentBackground])
        
        view.addSubViews(stackView)
        addressBackground.addSubViews(addressView)
        weekBackground.addSubViews(readmiView)
        timeBackground1.addSubViews(banerView)
        subscriptionPeriodBackground.addSubViews(banerPeriodView)
        paymentBackground.addSubViews(payment)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            
            addressView.topAnchor.constraint(equalTo: addressBackground.topAnchor, constant: 5),
            addressView.leadingAnchor.constraint(equalTo: addressBackground.leadingAnchor, constant: 5),
            addressView.trailingAnchor.constraint(equalTo: addressBackground.trailingAnchor, constant: -5),
            addressView.bottomAnchor.constraint(equalTo: addressBackground.bottomAnchor, constant: -15),
         
            
            readmiView.topAnchor.constraint(equalTo: weekBackground.topAnchor),
            readmiView.leadingAnchor.constraint(equalTo: weekBackground.leadingAnchor, constant: 5),
            readmiView.trailingAnchor.constraint(equalTo: weekBackground.trailingAnchor, constant: -5),
            readmiView.bottomAnchor.constraint(equalTo: weekBackground.bottomAnchor),
            readmiView.heightAnchor.constraint(equalToConstant: 60),
            
            banerView.topAnchor.constraint(equalTo: timeBackground1.topAnchor),
            banerView.leadingAnchor.constraint(equalTo: timeBackground1.leadingAnchor),
            banerView.trailingAnchor.constraint(equalTo: timeBackground1.trailingAnchor),
            banerView.bottomAnchor.constraint(equalTo: timeBackground1.bottomAnchor),
            banerView.heightAnchor.constraint(equalToConstant: 20),
            
            
            banerPeriodView.topAnchor.constraint(equalTo: subscriptionPeriodBackground.topAnchor),
            banerPeriodView.leadingAnchor.constraint(equalTo: subscriptionPeriodBackground.leadingAnchor),
            banerPeriodView.trailingAnchor.constraint(equalTo: subscriptionPeriodBackground.trailingAnchor),
            banerPeriodView.bottomAnchor.constraint(equalTo: subscriptionPeriodBackground.bottomAnchor),
            banerPeriodView.heightAnchor.constraint(equalToConstant: 20),
            contactView.heightAnchor.constraint(equalToConstant: 176),
            
            payment.topAnchor.constraint(equalTo: paymentBackground.topAnchor, constant: 5),
            payment.leadingAnchor.constraint(equalTo: paymentBackground.leadingAnchor),
            payment.trailingAnchor.constraint(equalTo: paymentBackground.trailingAnchor),
            payment.bottomAnchor.constraint(equalTo: paymentBackground.bottomAnchor, constant: -15),
            payment.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setupView() {
        
    }
    
    @objc private func tapAction() {
        let vc = AdresViewController()
        let screenHeight = UIScreen.main.bounds.height
    
        let halfScreenHeight = screenHeight / 2
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: halfScreenHeight)
        vc.view.frame = frame
        
   
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    
    @objc private func tapActionPay() {
        let vc = PayViewcontroller()
        let screenHeight = UIScreen.main.bounds.height

        let halfScreenHeight = screenHeight / 2
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: halfScreenHeight)
        vc.view.frame = frame
    
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    
}

extension CheckoutViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfScreenPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

class HalfScreenPresentationController: UIPresentationController {
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView else { return .zero }
        let containerHeight = containerView.bounds.height
        let presentedHeight = containerHeight / 2
        return CGRect(x: 0, y: containerHeight - presentedHeight, width: containerView.bounds.width, height: presentedHeight)
    }
}
