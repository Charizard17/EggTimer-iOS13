//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var timer = Timer()
    var progressValue = 0.0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        let initialEggTime = eggTimes[hardness]!
        var secondsRemaining = eggTimes[hardness]!
                
        titleLabel.text = sender.currentTitle!
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
                self.progressBar.progress = Float((Double(initialEggTime)-Double(secondsRemaining))/Double(initialEggTime))
            } else {
                self.timer.invalidate()
                self.titleLabel.text = "Done!"
                self.playSound()
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.volume = 0.5
        player.play()
        
    }
}
