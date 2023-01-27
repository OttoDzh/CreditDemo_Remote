//
//  MainViewController.swift
//  Credit
//
//  Created by Otto Dzhandzhuliya on 21.01.2023.
//

import UIKit

class MainViewController: UIViewController , UITextFieldDelegate {
    
    let maiView = MainView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = maiView
        addTargets()
        maiView.sum.delegate = self
        maiView.percentage.delegate = self
        maiView.days.delegate = self
       
     
    }
    
    func addTargets() {
        maiView.buttonToSum.addTarget(self, action: #selector(getSum), for: .touchUpInside)
        maiView.goToTheCreditButton.addTarget(self, action: #selector(goToCredit), for: .touchUpInside)
        
    }
    
    
 
    
    
    @objc func goToCredit() {
        let vc = CreditViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true,completion: nil)
       
    }
    
    @objc func getSum(sum:Double,percentage:Double,days:Double) -> Double {
        
        var totalSum: Double = 0
        
        
        let doubleSum = Double(maiView.sum.text!) ?? 0
        let doublePercentage = Double(maiView.percentage.text!) ?? 0
        let doubleDays = Double(maiView.days.text!) ?? 0
        let days = doubleDays/365
        
        totalSum = doubleSum + (doubleSum * doublePercentage * days) / 100
        
        if maiView.sum.text == "" || maiView.percentage.text == "" || maiView.days.text == "" || maiView.sum.text == "." || maiView.percentage.text == "." || maiView.days.text == "."  {
            
            let alertController = UIAlertController(title: "Error!", message: "Enter positive number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
            
            
        } else if Double(maiView.sum.text!)! > 0 && Double(maiView.percentage.text!)! > 0 && Double(maiView.days.text!)! > 0
        
        {
            maiView.result.text = "Your amount including accrued % \(totalSum)"
        } else {
            let alertController = UIAlertController(title: "Error!", message: "Enter positive number", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        view.endEditing(true)
       return totalSum
        
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


