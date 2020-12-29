//
//  ViewController.swift
//  EierWekker-iOS 14.3
//
//  Created by Hans Aangeenbrug on 27/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var updateProgress: UIProgressView!
    
    
    
    let  kookDir: [String: Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var timer = Timer()
    var totalTime = 60
    var timeCooked = 0
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!

        timer.invalidate()
        
        print("Kooktijd = ", kookDir[hardness]!)
        titleLabel.text = hardness
        
        updateProgress.progress = 0.0
        
        timeCooked = 0
        totalTime = kookDir[hardness]!
        
        print("start")
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }

    
    @objc func update() {
        if timeCooked < totalTime {
            timeCooked += 1
            print(timeCooked)
            updateProgress.progress = Float(timeCooked) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "KLAAR!"
        }
    }
    
}

