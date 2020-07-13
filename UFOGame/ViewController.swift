//
//  ViewController.swift
//  UFOGame
//
//  Created by cmStudent on 2019/11/14.
//  Copyright © 2019 cmStudent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var ufo: UIButton!
    var soundPlayer: AVAudioPlayer!
    var sePlayer: AVAudioPlayer!
    var timer = Timer()
    @IBOutlet weak var counterDisplay: UILabel!
    var count = 0
    var timer2 = Timer()
    var Attack = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let audioPath = Bundle.main.path(forResource: "BGM", ofType:"mp3")!
        let audioPath2 = Bundle.main.path(forResource: "small_explosion1", ofType:"mp3")!
        
        let audioUrl = URL(fileURLWithPath: audioPath)
        let audioUrl2 = URL(fileURLWithPath: audioPath2)
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            sePlayer = try AVAudioPlayer(contentsOf: audioUrl2)
        }catch{
            soundPlayer = nil
            sePlayer = nil
        }
        
        soundPlayer.delegate = self
        sePlayer.delegate = self
        soundPlayer.prepareToPlay()
        sePlayer.prepareToPlay()
        
        soundPlayer.play()
        
        animation()
        timerStart()
     
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goNext" {
            let nextView = segue.destination as!
            SecondViewController
            
            nextView.count = Attack
        }
    }
    
    @IBAction func AttackedUFO(_ sender: UIButton) {
        
        sePlayer.play()

        let explosion = UIImage(named: "fire")
        self.ufo.setImage(explosion, for: .highlighted)
        
        Attack = Attack + 1
        counterDisplay.text = String(Attack)
    }
    
    
    @objc func movingUFO(){
        
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       options: .allowUserInteraction,
                       animations:{
            let screenWidth = CGFloat(UIScreen.main.bounds.size.width)
            let screenHeight = CGFloat(UIScreen.main.bounds.size.height)
               
            let pointX = CGFloat.random(in: 50.0...screenWidth - 50.0)
            let pointY = CGFloat.random(in: 50.0...screenHeight - 50.0)
               
            self.ufo.center = CGPoint(x:pointX, y:pointY)
        } )
    }
    
                                                                                
    func animation(){
        timer = Timer.scheduledTimer(
            timeInterval:1.0,
        target: self,
        selector:#selector(movingUFO),
        userInfo: nil,
        repeats: true)
    }
    
    func timerStart(){
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeStamp), userInfo: nil, repeats: true)
    }
    
    @objc func timeStamp(){
        count = count + 1
        print(count)
        
        if count == 20 {
            performSegue(withIdentifier: "goNext", sender: nil)
        }
    }
    


}

