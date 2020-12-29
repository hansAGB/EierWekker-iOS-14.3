//
//  ViewController.swift
//  EierWekker-iOS 14.3
//
//  Created by Hans Aangeenbrug on 27/12/2020.
//

import UIKit

class ViewController: UIViewController {

    let  kookDir: [String: Int] = [
        "Soft" : 5,
        "Medium" : 8,
        "Hard" : 12
    ]
    
    var timer: Timer?
    var count = 60
    var timerRuns = false
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if !timerRuns {
            timerRuns = true
            
            print("Kooktijd = ", kookDir[hardness]!)
            
            // 60 x seconde is minuut
            count = 60 * kookDir[hardness]!
            
            print("start")
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        }
    }
    
    @objc func update() {
        if(count > 0) {
            print(count, "seconds")
            count = count - 1
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
            }
            print("end")
            timerRuns = false
        }
    }
    
}

