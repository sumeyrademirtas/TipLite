//
//  View.swift
//  TipLite
//
//  Created by Sümeyra Demirtaş on 10/7/24.
//

import UIKit

class TipView: UIView {
    // MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
       
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let enterBillLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter total bill"
        label.font = .systemFont(ofSize: .init(24))
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: .init(20))
        textField.textColor = .label
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = .init(10)
        textField.keyboardType = .decimalPad
        textField.placeholder = "$0.00"
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let chooseTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose tip percentage"
        label.font = .systemFont(ofSize: .init(24))
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tip10Button: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: .init(20))
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tip15Button: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: .init(20))
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tip20Button: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: .init(20))
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = .init(10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let customTipTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Custom%"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: .init(20))
        textField.textColor = .label
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = .init(10)
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let splitlabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: .init(24))
        label.text = "Split into:"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let peopleStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 20
        stepper.value = 1
        stepper.stepValue = 1
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    let stepperValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .label
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.backgroundColor = UIColor.mainOrange
        label.font = .boldSystemFont(ofSize: .init(20))
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.font = .systemFont(ofSize: .init(24))
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = UIColor.lightOrange
        label.font = .boldSystemFont(ofSize: .init(48))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill"
        label.font = .systemFont(ofSize: .init(20))
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = UIColor.lightOrange
        label.font = .boldSystemFont(ofSize: .init(20))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip"
        label.font = .systemFont(ofSize: .init(20))
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tipPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = UIColor.lightOrange
        label.font = .boldSystemFont(ofSize: .init(20))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup

    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let enterBillStack = UIStackView(arrangedSubviews: [enterBillLabel, billTextField])
        
        let percentageStack1 = UIStackView(arrangedSubviews: [tip10Button, tip15Button])
        let percentageStack2 = UIStackView(arrangedSubviews: [tip20Button, customTipTextField])
        let wholePercentageStack = UIStackView(arrangedSubviews: [chooseTipLabel, percentageStack1, percentageStack2])
        
//        let stepperStack = UIStackView(arrangedSubviews: [peopleStepper, stepperValueLabel])
//        let splitAllStack = UIStackView(arrangedSubviews: [splitlabel, stepperStack])
        
        let stepperStack = UIStackView(arrangedSubviews: [splitlabel, stepperValueLabel])
        let splitAllStack = UIStackView(arrangedSubviews: [stepperStack, peopleStepper])

        let totalPerPersonStack = UIStackView(arrangedSubviews: [totalPerPersonLabel, totalLabel])
        
        let billStack = UIStackView(arrangedSubviews: [billLabel, billPriceLabel])
        
        let tipStack = UIStackView(arrangedSubviews: [tipLabel, tipPriceLabel])
            
        // let lastBottomStack = UIStackView(arrangedSubviews: [totalPerPersonStack, billStack, tipStack])
        
        let billAndTipStack = UIStackView(arrangedSubviews: [billStack, tipStack])
        
        let totalAndBillTipStack = UIStackView(arrangedSubviews: [totalPerPersonStack, billAndTipStack])
        
        contentView.addSubview(enterBillStack)
        contentView.addSubview(wholePercentageStack)
        contentView.addSubview(splitAllStack)
        contentView.addSubview(totalAndBillTipStack)
        
//        addSubview(enterBillStack)
        enterBillStack.axis = .vertical
        enterBillStack.spacing = 15
        enterBillStack.alignment = .center
        enterBillStack.translatesAutoresizingMaskIntoConstraints = false
        
        percentageStack1.axis = .horizontal
        percentageStack1.spacing = 15
        percentageStack1.distribution = .fillEqually
        percentageStack1.translatesAutoresizingMaskIntoConstraints = false
        
        percentageStack2.axis = .horizontal
        percentageStack2.spacing = 15
        percentageStack2.distribution = .fillEqually
        percentageStack2.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(wholePercentageStack)
        wholePercentageStack.axis = .vertical
        wholePercentageStack.spacing = 15
        wholePercentageStack.alignment = .center
        wholePercentageStack.translatesAutoresizingMaskIntoConstraints = false
        
        stepperStack.axis = .horizontal
        stepperStack.spacing = 15
        stepperStack.alignment = .center
        stepperStack.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(splitAllStack)
        splitAllStack.axis = .vertical
        splitAllStack.spacing = 15
        splitAllStack.alignment = .center
        splitAllStack.translatesAutoresizingMaskIntoConstraints = false
        
        totalPerPersonStack.axis = .vertical
        totalPerPersonStack.spacing = 5
        totalPerPersonStack.alignment = .center
        totalPerPersonStack.translatesAutoresizingMaskIntoConstraints = false
        
        billStack.axis = .vertical
        billStack.spacing = 5
        billStack.alignment = .center
        billStack.translatesAutoresizingMaskIntoConstraints = false
        
        tipStack.axis = .vertical
        tipStack.spacing = 5
        tipStack.alignment = .center
        tipStack.translatesAutoresizingMaskIntoConstraints = false
        
        billAndTipStack.axis = .horizontal
        billAndTipStack.spacing = 30
        billAndTipStack.alignment = .center
        billAndTipStack.translatesAutoresizingMaskIntoConstraints = false
        
//        addSubview(totalAndBillTipStack)
        totalAndBillTipStack.axis = .vertical
        totalAndBillTipStack.spacing = 20
        totalAndBillTipStack.alignment = .center
        totalAndBillTipStack.translatesAutoresizingMaskIntoConstraints = false
        totalAndBillTipStack.backgroundColor = UIColor.mainOrange
    
        NSLayoutConstraint.activate([
            // ScrollView constraints
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                           
            // contentView constraints
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), // scroll yatay kaymamalı
            
            // enterBillStack constraints
            enterBillStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            enterBillStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            enterBillStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            enterBillStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            billTextField.widthAnchor.constraint(equalToConstant: 130),

            // wholePercentageStack constraints
            wholePercentageStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            wholePercentageStack.topAnchor.constraint(equalTo: enterBillStack.bottomAnchor, constant: 30),
            wholePercentageStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wholePercentageStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            tip10Button.widthAnchor.constraint(equalToConstant: 130),
            tip15Button.widthAnchor.constraint(equalToConstant: 130),
            tip20Button.widthAnchor.constraint(equalToConstant: 130),

            // splitAllStack constraints
            splitAllStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            splitAllStack.topAnchor.constraint(equalTo: wholePercentageStack.bottomAnchor, constant: 30),
            splitAllStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            splitAllStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            stepperValueLabel.widthAnchor.constraint(equalToConstant: 40),
            stepperValueLabel.heightAnchor.constraint(equalTo: splitlabel.heightAnchor),


            // totalAndBillTipStack constraints (splitAllStack'in altında)
            totalAndBillTipStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            totalAndBillTipStack.topAnchor.constraint(equalTo: splitAllStack.bottomAnchor, constant: 50),
            totalAndBillTipStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            totalAndBillTipStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            totalAndBillTipStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),

            totalPerPersonStack.topAnchor.constraint(equalTo: totalAndBillTipStack.topAnchor, constant: 20), // 20 birim üst boşluk
        
        ])
        totalAndBillTipStack.isLayoutMarginsRelativeArrangement = true
        totalAndBillTipStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // MARK: - Functions

    // Stepper update
    @objc func update(_ stepper: UIStepper) {
        print(stepper.value) // Konsola yazdirmaca
        stepperValueLabel.text = String(Int(stepper.value)) // label in icini guncellemeye calismaca
    }
}
