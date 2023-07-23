//
//  Rps.swift
//  RPSGame
//
//  Created by Dowon Kim on 01/07/2023.
//

import UIKit

// raw value
enum Rps: Int {
    case ready
    case rock
    case paper
    case scissors
    
    // computed properties to be playable
    var rpsInfo: (image: UIImage, name: String) {
        switch self {
        case .ready:
            return (#imageLiteral(resourceName: "ready"), "ready")
        case .rock:
            return (#imageLiteral(resourceName: "rock"), "rock")
        case .paper:
            return (#imageLiteral(resourceName: "paper"), "paper")
        case .scissors:
            return (#imageLiteral(resourceName: "scissors"), "가위")
        }
    }
}






