//
//  GameView.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import UIKit

class GameView: UIView {
    
    var bigWord = UILabel(text: "BigWord", font: ODFonts.titleLabelFont)
    var firstName = UILabel(text: "Vasya", font: ODFonts.avenirFont)
    var secondName = UILabel(text: "Nadya", font: ODFonts.avenirFont)
    let backButton = UIButton(title: "Back", bgColor: .clear, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 9)
    let firstPlayerPointLabel = UILabel(text: "15", font: ODFonts.titleLabelFontGreat)
    let secondPlayerPointLabel = UILabel(text: "15", font: ODFonts.titleLabelFontGreat)
    let firstView = UIView()
    let secondView = UIView()
    let wordTf = UITextField(placeholder: "Write a word")
    let checkButton = UIButton(title: "Enter", bgColor: .white, textColor: .black, font: ODFonts.avenirFont, cornerRadius: 12)
    let table = UITableView()
    var countdownLabel = UILabel(text: "60", font: ODFonts.titleLabelFont)
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupconstraints()
    }
    
    func setupViews() {
        backgroundColor = .black
        firstView.backgroundColor = .lightGray
        secondView.backgroundColor = .lightGray
        firstView.layer.cornerRadius = 12
        secondView.layer.cornerRadius = 12
        bigWord.textColor = .white
        firstName.textColor = .white
        secondName.textColor = .white
        firstPlayerPointLabel.textColor = .white
        secondPlayerPointLabel.textColor = .white
        wordTf.layer.cornerRadius = 15
        wordTf.textAlignment = .center
        
        table.register(GameCell.self, forCellReuseIdentifier: GameCell.reuseId)
        table.backgroundColor = .black
        table.layer.cornerRadius = 15
        table.separatorStyle = .none
        wordTf.textColor = .black
        countdownLabel.textColor = .white
        let pcForWordTf = NSAttributedString(string: "Write a word",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "colorForTf") as Any])
        wordTf.attributedPlaceholder = pcForWordTf
        
      
    }
    
    func setupconstraints() {
        
        let viewStack = UIStackView(arrangedSubviews: [firstView,secondView], axis: .horizontal, spacing: 6)
        
        addSubview(countdownLabel)
        addSubview(backButton)
        addSubview(bigWord)
        addSubview(viewStack)
        addSubview(firstPlayerPointLabel)
        addSubview(secondPlayerPointLabel)
        addSubview(firstName)
        addSubview(secondName)
        addSubview(wordTf)
        addSubview(checkButton)
        addSubview(table)
        
        Helper.tamicOff(views: [backButton,bigWord,viewStack,firstPlayerPointLabel,secondPlayerPointLabel,firstName,secondName,wordTf,checkButton,table,countdownLabel])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: topAnchor,constant: 36),
                                     backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     backButton.widthAnchor.constraint(equalToConstant: 60),
                                     bigWord.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     bigWord.topAnchor.constraint(equalTo: topAnchor, constant: 120),
                                     firstView.heightAnchor.constraint(equalToConstant: 160),
                                     secondView.heightAnchor.constraint(equalToConstant: 160),
                                     viewStack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     viewStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                                     viewStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                                     viewStack.topAnchor.constraint(equalTo: bigWord.bottomAnchor, constant: 25),
                                     firstView.widthAnchor.constraint(equalTo: secondView.widthAnchor),
                                     firstPlayerPointLabel.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
                                     firstPlayerPointLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
                                     secondPlayerPointLabel.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
                                     secondPlayerPointLabel.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
                                     firstName.centerXAnchor.constraint(equalTo: firstView.centerXAnchor),
                                     firstName.centerYAnchor.constraint(equalTo: firstView.bottomAnchor,constant: -24),
                                     secondName.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
                                     secondName.centerYAnchor.constraint(equalTo: secondView.bottomAnchor,constant: -24),
                                     wordTf.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     wordTf.topAnchor.constraint(equalTo: viewStack.bottomAnchor, constant: 20),
                                     wordTf.widthAnchor.constraint(equalToConstant: 250),
                                     wordTf.heightAnchor.constraint(equalToConstant: 50),
                                     checkButton.topAnchor.constraint(equalTo: wordTf.bottomAnchor, constant: 20),
                                     checkButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     checkButton.widthAnchor.constraint(equalToConstant: 160),
                                     checkButton.heightAnchor.constraint(equalToConstant: 50),
                                     countdownLabel.topAnchor.constraint(equalTo: topAnchor, constant: 36),
                                     countdownLabel.bottomAnchor.constraint(equalTo: bigWord.topAnchor, constant: -24),
                                     countdownLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
        
        NSLayoutConstraint.activate([table.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 24),
                                     table.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     table.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
                                     table.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -24)])
        
        
    }
    
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
