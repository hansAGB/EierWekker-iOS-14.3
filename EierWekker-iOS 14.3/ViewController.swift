//
//  ViewController.swift
//  EierWekker-iOS 14.3
//
//  Created by Hans Aangeenbrug on 27/12/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var updateProgress: UIProgressView!
    
    var player: AVAudioPlayer?
    let audioSession = AVAudioSession.sharedInstance()
    
    let  kookDir: [String: Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var timer = Timer()
    var totalTime = 60
    var timeCooked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print(error.localizedDescription)
        }
    }
    

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
            playSound()
        }
    }

    func playSound() {
       
        let url = Bundle.main.url(forResource: "EierWekker-iOS 14.3/alarm_sound", withExtension: "mp3")
        
        do {
            if url != nil {
                player = try AVAudioPlayer(contentsOf: url!)
            } else {
                print("mp3 not found")
                return
            }
        }
        catch {
            print(error.localizedDescription)
        }
        player!.prepareToPlay()
        player!.volume=1.0
        player!.play()
    }
    
}

