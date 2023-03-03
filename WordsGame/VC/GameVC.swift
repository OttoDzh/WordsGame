//
//  GameViewController.swift
//  WordsGame
//
//  Created by Otto Dzhandzhuliya on 26.02.2023.
//

import UIKit



class GameViewController: UIViewController,UITextFieldDelegate {
    
    let gameView = GameView()
    var firstUser: User
    var secondUser: User
    var timer: Timer?
    var countDow = 60
    var words = [String]()
    var isFirstUser = true
    
    
    init(user1:User,user2:User) {
        firstUser = user1
        secondUser = user2
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gameView
        addTargets()
        gameView.table.delegate = self
        gameView.table.dataSource = self
        gameView.firstName.text = firstUser.name
        gameView.secondName.text = secondUser.name
        gameView.firstView.layer.borderWidth = 5
        gameView.firstView.layer.borderColor = UIColor.red.cgColor
        setupTimer()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gameView.addGestureRecognizer(tap)
        gameView.wordTf.delegate = self
    }
    
    func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        countDow -= 1
        gameView.countdownLabel.text = "\(countDow)"
        
        if countDow <= 10 && countDow >= 1 {
            gameView.countdownLabel.textColor = .red
        }
        else  if countDow <= 0 {
            gameView.countdownLabel.text = "0"
            timer?.invalidate()
        }
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    private func wordToChars(word:String) -> [Character] {
        var chars = [Character]()
        for char in word.lowercased() {
            chars.append(char)
        }
        return chars
    }
    
    private func checkWord(word:String) -> Int {
        guard !(words.contains(word.lowercased())) else {
            let alertController = UIAlertController(title: "Note!", message: "This word is already used", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
                self.gameView.wordTf.text = ""
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
            return 0
        }
        
        var strChars = wordToChars(word: gameView.bigWord.text!)
        let wordChars = wordToChars(word: word)
        
        var result = ""
        for char in wordChars {
            if strChars.contains(char) {
                result.append(char)
                
                var i = 0
                while strChars[i] != char {
                    i += 1
                }
                strChars.remove(at: i)
            } else {
                let alertController = UIAlertController(title: "Note!", message: "This word cannot be made", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default) {(action) in
                }
                alertController.addAction(action)
                self.present(alertController, animated: true)
                result = ""
                break
            }
        }
        if result.count > 1 {
            words.append(result)
            if isFirstUser {
                print("first: \(result.count)")
                firstUser.score += result.count
                gameView.firstPlayerPointLabel.text = String(firstUser.score)
                gameView.firstView.layer.borderWidth = 0
                gameView.secondView.layer.borderWidth = 5
                gameView.secondView.layer.borderColor = UIColor.red.cgColor
            } else {
                print("second: \(result.count)")
                secondUser.score += result.count
                gameView.secondPlayerPointLabel.text = String(secondUser.score)
                gameView.secondView.layer.borderWidth = 0
                gameView.firstView.layer.borderWidth = 5
                gameView.firstView.layer.borderColor = UIColor.red.cgColor
            }
            isFirstUser = !isFirstUser
        }
        gameView.wordTf.text = ""
        gameView.table.reloadData()
        if firstUser.score >= 21 {
            let alertController = UIAlertController(title: "\(firstUser.name) WON!", message: "Winner", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
                self.dismiss(animated: true)
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
        } else if secondUser.score >= 21 {
            let alertController = UIAlertController(title: "\(secondUser.name) WON!", message: "Winner", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default) {(action) in
                self.dismiss(animated: true)
            }
            alertController.addAction(action)
            self.present(alertController, animated: true)
            
        }
        return result.count
    }
    
    func addTargets() {
        gameView.checkButton.addTarget(self, action: #selector(checkButtonTapeed), for: .touchUpInside)
        gameView.backButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }
    
    @objc func checkButtonTapeed() {
        
        guard let text = gameView.wordTf.text else {
            return
        }
        guard gameView.wordTf.text != "" else {
            return
        }
        countDow = 60
        gameView.countdownLabel.textColor = .white
        gameView.countdownLabel.text = "60"
        timer?.invalidate()
        setupTimer()
        
        print(checkWord(word: text))
    }
    
    
    
    @objc func dismissSelf() {
        let alertController = UIAlertController(title: "Quit?", message: "Are you sure?", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes", style: .destructive) {(action) in
            self.dismiss(animated: true)
        }
        let noAction = UIAlertAction(title: "No", style: .cancel)
        alertController.addAction(action)
        alertController.addAction(noAction)
        self.present(alertController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension GameViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.reuseId, for: indexPath) as! GameCell
        cell.importantOrNo.text =  words[indexPath.row]
        cell.urgentOrNo.text = String(words[indexPath.row].count)
        return cell
    }
    
    
}












