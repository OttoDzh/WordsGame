//
//  RulesVC.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 03.03.2023.
//

import UIKit

class RulesVC: UIViewController {
    
    let rulesView = RulesView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = rulesView
    }
}
