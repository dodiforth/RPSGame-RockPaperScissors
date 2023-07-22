//
//  ViewController.swift
//  RPSGame
//
//  Created by Dowon Kim on 01/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var cpuImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var cpuChoiceLabel: UILabel!
    @IBOutlet weak var userChoiceLabel: UILabel!
    
    @IBOutlet weak var scissorsBtn: UIButton!
    @IBOutlet weak var rockBtn: UIButton!
    @IBOutlet weak var paperBtn: UIButton!
    
    // an instance to mange business
    var rpsManager = RPSManager()
    
    var myChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var cpuChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var config = UIButton.Configuration.filled()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        
        //1) load "ready" image on the tow imageViews
        cpuImageView.image = rpsManager.getReady().rpsInfo.image
        userImageView.image = rpsManager.getReady().rpsInfo.image
        
        //2) load "ready" word on cpu and user ChoiceLabel.
        cpuChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        userChoiceLabel.text = rpsManager.getReady().rpsInfo.name
    }

    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        // store the info of which button has been tapped
//        guard let title = sender.currentTitle else {
//            return
//        }
        
//        let title = (sender as AnyObject).currentTitle
        let title = sender.currentTitle
        
        print(title)
        
        sender.configuration?.baseBackgroundColor = .systemGreen
        
        switch title {
        case "ROCK" :
            myChoice = Rps.rock
        case "PAPER" :
            myChoice = Rps.paper
        case "SCISSORS" :
            myChoice = Rps.scissors
        default :
            break
        }
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) load computer's random choice on cpu's imageView
        // 2) load computer's random choice on cpu's ChoiceLabel
        switch cpuChoice {
        case Rps.rock :
            cpuImageView.image = #imageLiteral(resourceName: "rock")
            cpuChoiceLabel.text = "ROCK"
        case Rps.paper :
            cpuImageView.image = #imageLiteral(resourceName: "paper")
            cpuChoiceLabel.text = "PAPER"
        case Rps.scissors :
            cpuImageView.image = #imageLiteral(resourceName: "scissors")
            cpuChoiceLabel.text = "SCISSORS"
        }
        
        // 3) load user's random choice on user's imageView
        // 4) load user's random choice on user's ChoiceLabel
        switch myChoice {
        case Rps.rock :
            userImageView.image = #imageLiteral(resourceName: "rock")
            userChoiceLabel.text = "ROCK"
        case Rps.paper :
            userImageView.image = #imageLiteral(resourceName: "paper")
            userChoiceLabel.text = "PAPER"
        case Rps.scissors :
            userImageView.image = #imageLiteral(resourceName: "scissors")
            userChoiceLabel.text = "SCISSORS"
        }
        
        // 5) Compare cpu's choice and user's choice and show it on mainLabel
        if cpuChoice == myChoice {
            mainLabel.text = "DRAW!"
        } else if cpuChoice == .rock && myChoice == .paper {
            mainLabel.text = "YOU WIN!"
        } else if cpuChoice == .paper && myChoice == .scissors {
            mainLabel.text = "YOU WIN!"
        } else if cpuChoice == .scissors && myChoice == .rock {
            mainLabel.text = "YOU WIN!"
        } else {
            mainLabel.text = "YOU LOST"
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) load ready on cpu's imageView
        // 2) load ready on cpu's ChoiceLabel
        cpuImageView.image = #imageLiteral(resourceName: "ready")
        cpuChoiceLabel.text = "READY"
        
        // 3) load ready user's imageView
        // 4) load ready on user's ChoiceLabel
        userImageView.image = #imageLiteral(resourceName: "ready")
        userChoiceLabel.text = "READY"
        
        // 5) mainLabel's string = "CHOOSE"
        mainLabel.text = "CHOOSE"
        
        // 6) let computer select R/P/S and store the info
        cpuChoice = Rps(rawValue: Int.random(in: 0...2))!
        myChoice = Rps(rawValue: Int.random(in: 0...2))!

        scissorsBtn.configuration?.baseBackgroundColor = .systemBlue
        rockBtn.configuration?.baseBackgroundColor = .systemBlue
        paperBtn.configuration?.baseBackgroundColor = .systemBlue
        
    }
    
}
