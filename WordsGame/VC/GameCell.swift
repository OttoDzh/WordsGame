//
//  GameCell.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import UIKit

class GameCell: UITableViewCell {

    static let reuseId = "TaskTableCell"
    let importantOrNo = UILabel(text: "Word", font: ODFonts.avenirFont)
    let urgentOrNo = UILabel(text: "Score", font: ODFonts.avenirFont)

    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: GameCell.reuseId)
        
        backgroundColor = .black
        importantOrNo.textColor = .white
        urgentOrNo.textColor = .white

        addSubview(importantOrNo)
        addSubview(urgentOrNo)
        Helper.tamicOff(views: [importantOrNo,urgentOrNo])
        
      
       
        
        NSLayoutConstraint.activate([importantOrNo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
                                     importantOrNo.topAnchor.constraint(equalTo: topAnchor,constant:12),
                                     urgentOrNo.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12),
                                     urgentOrNo.topAnchor.constraint(equalTo: topAnchor,constant: 12),
                                     importantOrNo.widthAnchor.constraint(equalToConstant: 200),
                                     importantOrNo.heightAnchor.constraint(equalToConstant: 30),
                                     urgentOrNo.widthAnchor.constraint(equalToConstant: 20),
                                     urgentOrNo.heightAnchor.constraint(equalToConstant: 30)])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


