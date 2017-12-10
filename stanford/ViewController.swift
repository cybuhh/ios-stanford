//
//  ViewController.swift
//  stanford
//
//  Created by cybuhh on 10/12/2017.
//  Copyright © 2017 cybuhh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var labels = ["🤪", "😎", "🤪", "😎"];
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip count: \(flipCount)"
        }
    }

    func flipButton(withEmoji emoji: String, on sender: UIButton) {
        if (sender.currentTitle == "") {
            sender.setTitle(emoji, for: UIControlState.normal)
            sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            sender.setTitle("", for: UIControlState.normal)
            sender.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1;
        if let cardNumber = cardButtons.index(of: sender) {
            flipButton(withEmoji: labels[cardNumber], on: sender)
        } else {
            print("choosen card not found in array")
        }
    }
}

