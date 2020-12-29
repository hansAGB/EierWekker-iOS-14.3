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

    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        print("Kooktijd = ", kookDir[hardness]!)
    }
    
}

