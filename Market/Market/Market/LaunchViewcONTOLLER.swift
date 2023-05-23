//
//  LaunchViewcONTOLLER.swift
//  Market
//
//  Created by macbook on 18.05.2023.
//

import Foundation
import UIKit

class LaunchViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = TabBarController()
        vc.modalTransitionStyle = .coverVertical //??
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
}
