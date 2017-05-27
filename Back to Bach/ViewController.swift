//
//  ViewController.swift
//  Back to Bach
//
//  Created by Raphael Reiter on 01/03/2017.
//  Copyright © 2017 Raphael Reiter. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
    var timer = Timer()
    
    func updateScrubber() {
    
        scrubber.value = Float(player.currentTime)
        
    }
    
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var scrubber: UISlider!
    
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        timer.invalidate()
        
    }
    @IBAction func scrubberControl(_ sender: Any) {
        
        player.currentTime = TimeInterval(scrubber.value)
        
    }

    @IBAction func volumeControl(_ sender: Any) {
        
        player.volume = volume.value
        
    }
    @IBAction func stop(_ sender: Any) {
        
        scrubber.value = 0
        timer.invalidate()
        player.pause()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            } catch {
            
            // process any errors
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            scrubber.maximumValue = Float(player.duration)
            
        
        } catch {
        
        // process any errors
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

