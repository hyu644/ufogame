//
//  SecondViewController.swift
//  UFOGame
//
//  Created by cmStudent on 2019/12/12.
//  Copyright © 2019 cmStudent. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var levelDisplay: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(count < 6){
            levelDisplay.text = "low"
        }else if(count < 14){
            levelDisplay.text = "normal"
        }else{
            levelDisplay.text = "high"
        }                               

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func gameover(_ sender: UIButton) {
        exit(0)
    }
}
