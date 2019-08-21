//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Борис Крисько on 8/20/19.
//  Copyright © 2019 Borys Krisko. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    
    @IBOutlet weak var startButtonOutlet: SpringButton!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var blueView: SpringView!
    
    var animations = ["shake",
                      "pop",
                      "morph",
                      "squeeze",
                      "wobble",
                      "swing",
                      "squeezeUp",
                      "slideLeft",
                      "fadeIn",
                      "flash"]
    
    var counter = 0
    var subcounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButtonOutlet.setTitle(animations[0], for: .normal)
        
        animations.shuffle()
        
        print(blueView.duration)
    }

    @IBAction func startButton(_ sender: SpringButton) {
        
        blueView.curve = "spring"
        blueView.duration = 1
        
        if counter < animations.count {
            blueView.animation = animations[counter]
            blueLabel.text = animations[counter]
        } else {
            blueLabel.text = animations[0]
            blueView.animation = animations[0]
            counter = 0
        }
        
        blueView.animate()
        
        counter += 1
        
        if subcounter < animations.count - 1 {
            startButtonOutlet.setTitle(animations[subcounter + 1], for: .normal)
        } else {
            startButtonOutlet.setTitle(animations[0], for: .normal)
            subcounter = -1
        }
        subcounter += 1
    }
}
