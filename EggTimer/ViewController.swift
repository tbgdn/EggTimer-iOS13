//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let secondsInMinute = 60
    let eggTimes = ["Soft": 5 * secondsInMinute, "Medium": 8 * secondsInMinute, "Hard": 12 * secondsInMinute]
    let initialText = "How do you like your eggs?"
    let finalText = "Done!"
    
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    var timer = Timer()
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        resetUi()
        
        let hardness = sender.currentTitle
        mainTitle.text = hardness
        totalTime = eggTimes[hardness!]!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
            } else {
                self.mainTitle.text = self.finalText
                self.timer.invalidate()
            }
            self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
            
            self.secondsLabel.text = "\(self.totalTime - self.secondsPassed) seconds remaining"
        }
    }
    
    func resetUi(){
        secondsPassed = 0
        progressBar.progress = 0.0
        mainTitle.text = initialText
    }
    
}
