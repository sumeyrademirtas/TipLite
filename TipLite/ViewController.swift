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
    var selectedTipPercentage: Double = 10.0 // Default tip
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "TipLite"
        setupUI()
        setupTargets()
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
    
    // Tip button funcs
    @objc func tipButtonTapped(_ sender: UIButton) {
        // Tüm butonların seçimini kaldır
        tipView.tip10Button.setSelected(false)
        tipView.tip15Button.setSelected(false)
        tipView.tip20Button.setSelected(false)
        
        // Tıklanan butonu seçili yap
        sender.setSelected(true)
        switch sender {
        case tipView.tip10Button:
            selectedTipPercentage = 10.0
        case tipView.tip15Button:
            selectedTipPercentage = 15.0
        case tipView.tip20Button:
            selectedTipPercentage = 20.0
        default:
            break
        }
        
        // Custom Tip TextField'i varsayılan renklere döndür
        tipView.customTipTextField.backgroundColor = .systemGray6
        tipView.customTipTextField.textColor = .label
        tipView.customTipTextField.text = ""
        
        updateTipCalculation()
    }
    
    // Custom tip text field'deki değişiklikleri işleme
    @objc func customTipChanged(_ sender: UITextField) {
        // Eğer customTipTextField'in içi doluysa arka plan ve metin rengini değiştir
        if let customTipText = sender.text, !customTipText.isEmpty {
            // TextField doluysa renkleri değiştir
            sender.backgroundColor = UIColor.darkGreen
            sender.textColor = .white
        } else {
            // TextField boşsa varsayılan renklere dön
            sender.backgroundColor = .systemGray6
            sender.textColor = .label
        }
        
        // Eğer customTipTextField'e yazı yazılmaya başlanırsa butonların seçimi kalksın
        tipView.tip10Button.setSelected(false)
        tipView.tip15Button.setSelected(false)
        tipView.tip20Button.setSelected(false)
        
        guard let customTipText = sender.text, let customTip = Double(customTipText) else {
            return
        }
        // Custom girilen değeri kullan
        selectedTipPercentage = customTip
        updateTipCalculation()
    }
    
    @objc func billAmountChanged(_ sender: UITextField) {
        if let billAmountText = sender.text, billAmountText.isEmpty {
            // Eğer metin boşsa, label'ları sıfırla
            resetLabelsToDefault()
        } else {
            // Metin boş değilse, normal hesaplama işlemini yap
            updateTipCalculation()
        }
    }
    
    func resetLabelsToDefault() {
        tipView.billPriceLabel.text = "$0.00"
        tipView.tipPriceLabel.text = "$0.00"
        tipView.totalLabel.text = "$0.00"
    }

    // Stepper
    @objc func stepperValueChanged(_ sender: UIStepper) {
        tipView.stepperValueLabel.text = String(Int(sender.value))
        updateTipCalculation()
    }
    
    // Calculations and update ui
    func updateTipCalculation() {
        guard let billAmountText = tipView.billTextField.text,
              let billAmount = Double(billAmountText) else { return }
            
        let numberOfPeople = Int(tipView.peopleStepper.value)
            
        let tipCalculator = TipCalculator(billAmount: billAmount, tipPercentage: selectedTipPercentage, numberOfPeople: numberOfPeople)
            
        tipView.billPriceLabel.text = String(format: "$%.2f", tipCalculator.calculateBillPerPerson())
        tipView.tipPriceLabel.text = String(format: "$%.2f", tipCalculator.calculateTipPerPerson())
        tipView.totalLabel.text = String(format: "$%.2f", tipCalculator.calculateTotalPerPerson())
    }
    
    // setup Targets
    private func setupTargets() {
        tipView.tip10Button.addTarget(self, action: #selector(tipButtonTapped(_:)), for: .touchUpInside)
        tipView.tip15Button.addTarget(self, action: #selector(tipButtonTapped(_:)), for: .touchUpInside)
        tipView.tip20Button.addTarget(self, action: #selector(tipButtonTapped(_:)), for: .touchUpInside)
        tipView.peopleStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        tipView.customTipTextField.addTarget(self, action: #selector(customTipChanged(_:)), for: .editingChanged)
        tipView.billTextField.addTarget(self, action: #selector(billAmountChanged(_:)), for: .editingChanged)
    }
}

extension UIButton {
    func setSelected(_ isSelected: Bool) {
        if isSelected {
            backgroundColor = UIColor.darkGreen
            setTitleColor(.white, for: .normal)
        } else {
            backgroundColor = .systemGray6 
            setTitleColor(.label, for: .normal)
        }
    }
}
