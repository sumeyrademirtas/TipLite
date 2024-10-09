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
    var selectedTipPercentage: Double = 0.0 // Default tip
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        title = "TipLite"
        setupUI()
        setupTargets()
        
        // Klavye kapatmak için tap gesture ekleyelim
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        // Klavye açıldığında ve kapandığında bildirimleri dinle
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // Keyboard will show
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            tipView.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        }
    }
    
    // Keyboard will hide
    @objc func keyboardWillHide(notification: NSNotification) {
        tipView.scrollView.contentInset = .zero
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
    
    
    @objc func customTipChanged(_ sender: UITextField) {
        if var customTipText = sender.text, !customTipText.isEmpty {
            // Virgülü noktaya çevir
            customTipText = customTipText.replacingOccurrences(of: ",", with: ".")
            sender.text = customTipText
            
            // Text doluysa arka plan ve renk değişsin
            sender.backgroundColor = UIColor.darkGreen
            sender.textColor = .white
            
            // Girilen değer geçerliyse onu kullan, değilse 0 yap
            if let customTip = Double(customTipText) {
                selectedTipPercentage = customTip
            } else {
                selectedTipPercentage = 0.0 // Geçerli bir sayı değilse 0 olarak algıla
            }
        } else {
            // Eğer TextField tamamen boşsa bahşiş oranını 0 yap
            selectedTipPercentage = 0.0
            sender.backgroundColor = .systemGray6
            sender.textColor = .label
        }
        
        // Her değişiklikten sonra hesaplamayı güncelle
        updateTipCalculation()
    }
    
    @objc func billAmountChanged(_ sender: UITextField) {
        if var billAmountText = sender.text, !billAmountText.isEmpty {
            // Virgülü noktaya çevir
            billAmountText = billAmountText.replacingOccurrences(of: ",", with: ".")
            sender.text = billAmountText
            
            // Normal hesaplama işlemini yap
            updateTipCalculation()
        } else {
            // Eğer metin boşsa, label'ları sıfırla
            resetLabelsToDefault()
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
