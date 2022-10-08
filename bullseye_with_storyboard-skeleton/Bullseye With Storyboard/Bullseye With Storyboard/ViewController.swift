//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation


class ViewController:
    
    UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    var randomNumber = 0
    var range = 100
    var level = 1
    var highest = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(highest)
    }
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
                playAgainButton.isHidden = false
            }
            
        } else {
            if (Int(numSlider.value) == Int(numLabel.text ?? "0")) {
                resultLabel.text = "Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                    
                level += 1
                currentLevel.text = String(level)
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                resultLabel.text = "You missed! Your value was \(Int(numSlider.value))."
                playAgainButton.isHidden = false
            }
        }
        resultLabel.isHidden = false //we'll come back to this
    
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true //must reappear next time it is checked ^
        playAgainButton.isHidden = true
            
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
        
        if (level - 1 > highest && level != 1) {
            highest = level - 1
            highScore.text = String(highest)
        }
        
        level = 1
        currentLevel.text = String(level)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }

}

