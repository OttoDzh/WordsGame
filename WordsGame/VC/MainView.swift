//
//  MainView.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import UIKit

class MainView: UIView {
    
    let gameLabel = UILabel(text: "WordsGame", font: ODFonts.titleLabelFont)
    let wordTf = UITextField(placeholder: "Choose word")
    let firstPlayerNameTf = UITextField(placeholder: "First player")
    let secondPlayerNameTf = UITextField(placeholder: "Second player")
    let startButton = UIButton(title: "Start", bgColor: .systemBlue, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 12)
    let rulesButton = UIButton(title: "Rules of the game", bgColor: .black, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 12)
    

    init() {
        super.init(frame: CGRect())
        setupViews()
        setupconstraints()
    }
    
    func setupViews() {
        gameLabel.textColor = .white
        
        let tfArray = [wordTf,firstPlayerNameTf,secondPlayerNameTf]
        for tf in tfArray {
            tf.layer.cornerRadius = 12
            tf.textAlignment = .center
            tf.textColor = .black
        }
        let pcForWordTf = NSAttributedString(string: "Create a word",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "colorForTf") as Any])
        wordTf.attributedPlaceholder = pcForWordTf
        let pcForFirstTf = NSAttributedString(string: "First player",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "colorForTf") as Any])
        firstPlayerNameTf.attributedPlaceholder = pcForFirstTf
        let pcForSecondTf = NSAttributedString(string: "Second player",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "colorForTf") as Any])
        secondPlayerNameTf.attributedPlaceholder = pcForSecondTf
        
        
    }
    
    func setupconstraints() {
        let stack = UIStackView(arrangedSubviews: [firstPlayerNameTf,secondPlayerNameTf], axis: .vertical, spacing: 10)
        addSubview(gameLabel)
        addSubview(wordTf)
        addSubview(stack)
        addSubview(startButton)
        addSubview(rulesButton)
        
        Helper.tamicOff(views: [gameLabel,wordTf,stack,startButton,rulesButton])
        
        NSLayoutConstraint.activate([gameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 80),
                                     gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     wordTf.topAnchor.constraint(equalTo: gameLabel.bottomAnchor, constant: 120),
                                     wordTf.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     wordTf.widthAnchor.constraint(equalToConstant: 250),
                                     wordTf.heightAnchor.constraint(equalToConstant: 30),
                                     stack.topAnchor.constraint(equalTo: wordTf.bottomAnchor, constant: 60),
                                     stack.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     firstPlayerNameTf.widthAnchor.constraint(equalToConstant: 250),
                                     secondPlayerNameTf.widthAnchor.constraint(equalToConstant: 250),
                                     firstPlayerNameTf.heightAnchor.constraint(equalToConstant: 30),
                                     secondPlayerNameTf.heightAnchor.constraint(equalToConstant: 30),
                                     startButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 60),
                                     startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     startButton.widthAnchor.constraint(equalToConstant: 300),
                                     startButton.heightAnchor.constraint(equalToConstant: 40),
                                     rulesButton.topAnchor.constraint(equalTo: bottomAnchor, constant: -90),
                                     rulesButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     rulesButton.widthAnchor.constraint(equalToConstant: 300),
                                     rulesButton.heightAnchor.constraint(equalToConstant: 40)])
        
    }
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
