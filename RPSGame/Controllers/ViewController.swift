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
    
    // an instance to mange business
    var rpsManager = RPSManager()
    
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
        
        // store the info of which selection(rock/paper/scissors) has been tapped ⭐️
        
        // bring value(title) of the pressed button
        guard let title = sender.currentTitle else { return }
        //let title = sender.currentTitle!
        print(title)
        
        
        rpsManager.userGetSelected(name: title)
        
        }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) load computer's random choice on cpu's imageView
        // 2) load computer's random choice on cpu's ChoiceLabel
        cpuImageView.image = rpsManager.getComputerRPS().rpsInfo.image
        cpuChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name
        
        // 3) load user's random choice on user's imageView
        // 4) load user's random choice on user's ChoiceLabel
        userImageView.image = rpsManager.getUserRPS().rpsInfo.image
        userChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.name
        
        // 5) Compare cpu's choice and user's choice and show it on mainLabel
        mainLabel.text = rpsManager.getRpsResult()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) load ready on cpu's imageView
        // 2) load ready on cpu's ChoiceLabel
        cpuImageView.image = rpsManager.getReady().rpsInfo.image
        cpuChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        // 3) load ready user's imageView
        // 4) load ready on user's ChoiceLabel
        userImageView.image = rpsManager.getReady().rpsInfo.image
        userChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        // 5) mainLabel's string = "CHOOSE"
        mainLabel.text = "CHOOSE"
        
        // 6) let computer select R/P/S and store the info
        rpsManager.allReset()
        
    }
    
}
