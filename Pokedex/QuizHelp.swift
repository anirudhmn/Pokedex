//
//  QuizHelp.swift
//  Pokedex
//
//  Created by Anirudh on 9/10/16.
//  Copyright © 2016 Anirudh. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class QuizHelp: UIViewController{
    @IBOutlet weak var beginningView: UIView!
    
    var finishedQuiz = false
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        if(finishedQuiz){
            beginningView.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destinationViewController = segue.destination as? Quiz{
            destinationViewController.musicPlayer = musicPlayer
        }
        else if let destinationViewController = segue.destination as? ViewController{
            destinationViewController.first = false
            destinationViewController.musicPlayer = musicPlayer
        }
    }
    
}
