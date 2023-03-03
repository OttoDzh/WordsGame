//
//  RulesView.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 03.03.2023.
//

import UIKit

class RulesView: UIView {
    
    let textView = UITextView()
    
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupconstraints()
    }
    
    func setupViews() {
        backgroundColor = .black
        textView.backgroundColor = .black
        textView.textColor = .white
        textView.font = ODFonts.avenirFont
        textView.text = "Цель игры – составить максимальное количество слов из предложенного длинного слова. Каждую букву длинного слова можно использовать в новом слове только один раз. Буквы можно использовать в произвольном порядке. Повторение слов запрещено.       Побеждает тот, у кого оказалось суммарно больше букв во всех его словах.                                                                        The goal of the game is to make the maximum number of words from the given long word. Each letter of the long word can only be used once in a new word. Letters can be used in any order. Repetition of words is prohibited. The winner is the one who has a total of more letters in all his words."
        textView.layer.cornerRadius = 15
        
        
    }
    
    func setupconstraints() {
        addSubview(textView)
        
        Helper.tamicOff(views: [textView])
        
        NSLayoutConstraint.activate([textView.topAnchor.constraint(equalTo: topAnchor, constant: 36),
                                     textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
                                     textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
                                     textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
