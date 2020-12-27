//
//  ViewController.swift
//  EierWekker-iOS 14.3
//
//  Created by Hans Aangeenbrug on 27/12/2020.
//

import UIKit

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 8
    let hardTime = 12
    var kooktijd: Int = 0

    @IBAction func buttonPressed(_ sender: UIButton) {
        let hardness = sender.currentTitle
        
        if hardness == "Soft" {
            kooktijd = softTime
        } else if hardness == "Medium" {
            kooktijd = mediumTime
        } else {
            kooktijd = hardTime
        }
        
        print("Kooktijd is ", kooktijd)
    }
    
}

