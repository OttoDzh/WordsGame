//
//  ViewController.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {
     
    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addTargets()
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        mainView.addGestureRecognizer(tap)
        mainView.wordTf.delegate = self
        mainView.firstPlayerNameTf.delegate = self
        mainView.secondPlayerNameTf.delegate = self
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    func addTargets() {
        mainView.startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        mainView.rulesButton.addTarget(self, action: #selector(goToRulesVC), for: .touchUpInside)
    }
  
    @objc func goToRulesVC() {
        let vc = RulesVC()
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
    
    @objc func startGame() {
        guard mainView.wordTf.text!.count > 7 else {
            let alertController = UIAlertController(title: "Error!", message: "Minimum 8 letters", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
            return
        }
        let vc = GameViewController(user1: User(name: "", score: 0), user2: User(name: "", score: 0))
        vc.modalPresentationStyle = .fullScreen
        vc.gameView.bigWord.text = mainView.wordTf.text!
        if mainView.firstPlayerNameTf.text == "" {
            vc.firstUser = User(name: "Player 1", score: 0)
        } else {
            vc.firstUser = User(name: mainView.firstPlayerNameTf.text!, score: 0)
        }
        if mainView.firstPlayerNameTf.text == "" {
            vc.secondUser = User(name: "Player 2", score: 0)
        } else {
            vc.secondUser = User(name: mainView.secondPlayerNameTf.text!, score: 0)
        }
        vc.gameView.firstPlayerPointLabel.text = "0"
        vc.gameView.secondPlayerPointLabel.text = "0"
        self.present(vc, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
}



    
    



    
    


