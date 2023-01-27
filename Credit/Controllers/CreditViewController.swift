//
//  CreditViewController.swift
//  Credit
//
//  Created by Otto Dzhandzhuliya on 23.01.2023.
//

import UIKit

class CreditViewController: UIViewController, UITextFieldDelegate {
    
    let creditView = CreditView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = creditView
        addTargets()
        creditView.creditSum.delegate = self
        creditView.percentage.delegate = self
        creditView.period.delegate = self
    }
    
    
    
    func addTargets() {
        creditView.dismissButton.addTarget(self, action: #selector(dismisSelf), for: .touchUpInside)
        creditView.buttonToSum.addTarget(self, action: #selector(getSumCredit), for: .touchUpInside)
    }
    
    @objc func getSumCredit(sum:Double,percentage:Double,period:Double) -> Double {
        
        var totalSum: Double = 0
        
        let doubleSum = Double(creditView.creditSum.text!) ?? 0
        let doublePercentage = Double(creditView.percentage.text!) ?? 0
        let doublePeriod = Double(creditView.period.text!) ?? 0
        

        
        let monthPerc = doublePercentage / 12 / 100
        let step = 1 + monthPerc
        let powR = pow(step,doublePeriod)
        
        
        
        let monthP = doubleSum * monthPerc * powR / ((powR) - 1)
        totalSum = monthP * doublePeriod
        
        if creditView.creditSum.text == "" || creditView.percentage.text == "" || creditView.period.text == "" || creditView.creditSum.text == "." || creditView.percentage.text == "." || creditView.period.text == "." {
            
            let alertController = UIAlertController(title: "Error!", message: "Enter positive numeric value", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
        
        }
        
        else if Double(creditView.creditSum.text!)! > 0 && Double(creditView.percentage.text!)! > 0  && Double(creditView.period.text!)! > 0  {
            
            creditView.monthpay.text = "Monthly payment: \(monthP)"
                creditView.totalSum.text = "Total amount to be payed: \(totalSum)"
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Fil in", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .destructive)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            
        }
        
        view.endEditing(true)
        return totalSum
        
    }
    
    
    
    @objc func dismisSelf() {
        self.dismiss(animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let aSet = NSCharacterSet(charactersIn:".0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
