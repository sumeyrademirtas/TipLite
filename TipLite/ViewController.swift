//
//  ViewController.swift
//  TipLite
//
//  Created by Sümeyra Demirtaş on 10/7/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    var tipView = TipView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        self.title = "TipLite"
        setupUI()
    }
    
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(tipView)
        
        tipView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tipView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tipView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tipView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

