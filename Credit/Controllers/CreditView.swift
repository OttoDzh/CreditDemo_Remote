//
//  CreditView.swift
//  Credit
//
//  Created by Otto Dzhandzhuliya on 23.01.2023.
//

import UIKit

class CreditView: UIView {
    
    let creditLabel = UILabel(text: "Credit calculator", font: ODFonts.titleLabelFont)
    let creditSum = UITextField(placeholder: "Сумма кредита")
    let percentage = UITextField(placeholder: "Процентная ставка")
    let period = UITextField(placeholder: "Срок кредита")
    let buttonToSum = UIButton(title: "Calculate", bgColor: .systemBlue, textColor: .black, font: ODFonts.avenir, cornerRadius: 15)
    let totalSum = UILabel(text: "", font: ODFonts.avenir)
    let dismissButton = UIButton(title: "Go to the deposit calculator", bgColor: .systemBlue, textColor: .black, font: ODFonts.avenir, cornerRadius: 15)
    let monthpay = UILabel(text: "", font: ODFonts.avenir)

    init() {
        super.init(frame: CGRect())
        setupSubviews()
        setupConstraints()
    }
    
    
    func setupSubviews() {
        backgroundColor = .white
        
        creditSum.backgroundColor = .systemBlue
        percentage.backgroundColor = .systemBlue
        period.backgroundColor = .systemBlue
        creditSum.layer.cornerRadius = 15
        percentage.layer.cornerRadius = 15
        period.layer.cornerRadius = 15
        monthpay.textColor = .black
        totalSum.textColor = .black
        creditLabel.textColor = .black
        totalSum.numberOfLines = 0
        totalSum.lineBreakMode = .byWordWrapping
        monthpay.lineBreakMode = .byWordWrapping
        monthpay.numberOfLines = 0

        
        let placeholderText = NSAttributedString(string: "Investment amount",attributes: [NSAttributedString.Key.foregroundColor  : UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)])
        creditSum.attributedPlaceholder = placeholderText
        let pcForPercentage = NSAttributedString(string: "Interest rate",attributes: [NSAttributedString.Key.foregroundColor  : UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)])
        percentage.attributedPlaceholder = pcForPercentage
        let pcForPeriod = NSAttributedString(string: "loan term/month",attributes: [NSAttributedString.Key.foregroundColor  : UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)])
        period.attributedPlaceholder = pcForPeriod
        
    }
    
    func setupConstraints() {
        let stack = UIStackView(arrangedSubviews: [creditLabel,creditSum,percentage,period], axis: .vertical, spacing: 10)
        
        
        
        addSubview(stack)
        addSubview(buttonToSum)
        addSubview(totalSum)
        addSubview(dismissButton)
        addSubview(monthpay)
        
        Helper.tamicOff(views: [stack,buttonToSum,totalSum,dismissButton,monthpay])
        
        
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.topAnchor.constraint(equalTo: topAnchor,constant: 96),
                                     buttonToSum.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     buttonToSum.topAnchor.constraint(equalTo: stack.bottomAnchor,constant:16),
                                     totalSum.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     totalSum.topAnchor.constraint(equalTo: buttonToSum.bottomAnchor,constant:32),
                                     dismissButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     dismissButton.topAnchor.constraint(equalTo: monthpay.bottomAnchor, constant: 64),
                                     monthpay.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     monthpay.topAnchor.constraint(equalTo: totalSum.bottomAnchor,constant: 32),
                                     monthpay.widthAnchor.constraint(equalToConstant: 200),
                                     totalSum.widthAnchor.constraint(equalToConstant: 200),
                                     creditSum.widthAnchor.constraint(equalToConstant: 250)])
        
        NSLayoutConstraint.activate([creditSum.heightAnchor.constraint(equalToConstant: 40),
                                     period.heightAnchor.constraint(equalToConstant: 40),
                                     percentage.heightAnchor.constraint(equalToConstant: 40),
                                     buttonToSum.widthAnchor.constraint(equalTo: creditSum.widthAnchor),
                                     buttonToSum.heightAnchor.constraint(equalTo: creditSum.heightAnchor),
                                     dismissButton.widthAnchor.constraint(equalToConstant: 350),
                                     totalSum.heightAnchor.constraint(equalToConstant: 96),
                                     monthpay.heightAnchor.constraint(equalToConstant: 96)])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
