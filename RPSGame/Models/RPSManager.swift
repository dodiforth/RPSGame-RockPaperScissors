//
//  RPSManager.swift
//  RPSGame
//
//  Created by Dowon Kim on 21/07/2023.
//

import UIKit

struct RPSManager {
    
    private var comChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var myChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRPS() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return comChoice
    }
    
    mutating func userGetSelected(name: String) {
        switch name {
        case "scissors":
            myChoice = Rps.scissors
        case "rock":
            myChoice = Rps.rock
        case "paper":
            myChoice = Rps.paper
        default:
            myChoice = Rps.rock
        }
    }
    
    func getRpsResult() -> String {
        if comChoice == myChoice {
            return "DRAW!"
        } else if comChoice == .rock && myChoice == .paper {
            return "YOU WIN!"
        } else if comChoice == .paper && myChoice == .scissors {
            return "YOU WIN!"
        } else if comChoice == .scissors && myChoice == .rock {
            return "YOU WIN!"
        } else {
            return "YOU LOST!"
        }
    }
    
    mutating func allReset() {
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
}
