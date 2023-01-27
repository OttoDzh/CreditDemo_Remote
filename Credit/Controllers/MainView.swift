//
//  MainView.swift
//  Credit
//
//  Created by Otto Dzhandzhuliya on 21.01.2023.
//

import UIKit

class MainView: UIView {
    
    var sum = UITextField(placeholder: "Введите сумму вклада")
    var percentage = UITextField(placeholder: "Введите процентную ставку")
    var days = UITextField(placeholder: "Введите срок вклада в днях")
    var buttonToSum = UIButton(title: "Calculate", bgColor: .blue, textColor: .white, font: ODFonts.avenir, cornerRadius: 15)
    var result = UILabel(text: "", font: ODFonts.avenir)
    var labelBezKapit = UILabel(text: "Deposit calculator", font: ODFonts.titleLabelFont)
    var goToTheCreditButton = UIButton(title: "Go to the credit calculator", bgColor: .blue, textColor: .white, font: ODFonts.avenir, cornerRadius: 15)
   
    
    
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
        
    }
    
    
    func setupViews() {
        backgroundColor = .black
        result.backgroundColor = .white
        sum.layer.cornerRadius = 10
        
        percentage.layer.cornerRadius = 10
        days.layer.cornerRadius = 10
        result.clipsToBounds = true
        result.layer.cornerRadius = 10
        labelBezKapit.textColor = .blue
        result.textAlignment = .center
        result.numberOfLines = 0
        result.adjustsFontSizeToFitWidth = true
        result.sizeToFit()
        result.lineBreakMode = .byWordWrapping
        sum.clearButtonMode = .whileEditing
        
    
        
        sum.textColor = .blue
        percentage.textColor = .blue
        days.textColor = .blue
        days.backgroundColor = .lightGray
        percentage.backgroundColor = .lightGray
        sum.backgroundColor = .lightGray
        result.backgroundColor = .black
        result.textColor = .white
        
        let placeholderText = NSAttributedString(string: "Deposit amount",attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        sum.attributedPlaceholder = placeholderText
        let pcForPercentage = NSAttributedString(string: "Interest rate",attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
        percentage.attributedPlaceholder = pcForPercentage
        let pcForDays = NSAttributedString(string: "Deposit term/days",attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
        days.attributedPlaceholder = pcForDays
        
        
        
        
        
    }
    
    func setupConstraints() {
        
        let stack = UIStackView(arrangedSubviews: [sum,percentage,days,buttonToSum], axis: .vertical, spacing: 10)
      
        addSubview(labelBezKapit)
        addSubview(stack)
        addSubview(result)
        addSubview(goToTheCreditButton)
       
        
        Helper.tamicOff(views: [stack,labelBezKapit,sum,percentage,buttonToSum,result,days,goToTheCreditButton])
        
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stack.topAnchor.constraint(equalTo: labelBezKapit.bottomAnchor,constant: 46),
                                     sum.heightAnchor.constraint(equalToConstant: 36),
                                     sum.widthAnchor.constraint(equalToConstant: 250),
                                     percentage.heightAnchor.constraint(equalToConstant: 36),
                                     days.heightAnchor.constraint(equalToConstant: 36),
                                     result.heightAnchor.constraint(equalToConstant: 96),
                                     result.widthAnchor.constraint(equalToConstant: 200),
                                     result.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([result.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 32)])
        
        NSLayoutConstraint.activate([labelBezKapit.topAnchor.constraint(equalTo: topAnchor,constant: 96),
                                     labelBezKapit.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([goToTheCreditButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     goToTheCreditButton.topAnchor.constraint(equalTo: result.bottomAnchor,constant: 32),
                                     goToTheCreditButton.widthAnchor.constraint(equalToConstant: 350),
                                   ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
