//
//  View.swift
//  TipLite
//
//  Created by Sümeyra Demirtaş on 10/7/24.
//

import UIKit

class TipView: UIView {
    // MARK: - Properties
    
    let enterBillLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter Total Bill"
        label.font = .systemFont(ofSize: .init(20))
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: .init(14))
        textField.textColor = .label
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let chooseTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Tip Percentage"
        label.font = .systemFont(ofSize: .init(14))
        label.textColor = .label
        return label
    }()
    
    let tip10Button: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        return button
    }()
    
    let tip15Button: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        return button
    }()
    
    let tip20Button: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        return button
    }()
    
    let tipCustomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        return button
    }()
    
    let customTipTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Custom Tip Percentage"
        textField.textColor = .label
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = .init(10)
        return textField
    }()
    
    let splitlabel: UILabel = {
        let label = UILabel()
        label.text = "Split"
        label.textColor = .label
        return label
    }()
    
    let peopleStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 20
        stepper.value = 1
        stepper.stepValue = 1
        
        stepper.addTarget(TipView.self, action: #selector(update(_:)), for: .valueChanged) // ONEMLI: Eger duzgun calismazsa Tipview.self ten kaynakli olabilir. ViewController i vermeyi dene. ya da diger bir secenek observer eklenebilir.
        return stepper
    }()
    
    let stepperValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .label
        return label
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Per Person"
        label.textColor = .label
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .label
        return label
    }()
    
    let billLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill"
        label.textColor = .label
        return label
    }()
    
    let billPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .label
        return label
    }()
    
    let tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip"
        label.textColor = .label
        return label
    }()
    
    let tipPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .label
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [enterBillLabel, billTextField, chooseTipLabel, tip10Button, tip15Button, tip20Button, tipCustomButton, customTipTextField, splitlabel, peopleStepper, stepperValueLabel, totalPerPersonLabel, totalLabel, billLabel, billPriceLabel, tipLabel, tipPriceLabel])
        
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 15
        //stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView'i tüm ekrana ortala
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - Functions

    @objc func update(_ stepper: UIStepper) {
        print(stepper.value) // Konsola yazdirmaca
        stepperValueLabel.text = String(Int(stepper.value)) // label in icini guncellemeye calismaca
    }
}
