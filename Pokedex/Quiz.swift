//
//  Quiz.swift
//  Pokedex
//
//  Created by Anirudh on 9/10/16.
//  Copyright © 2016 Anirudh. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Quiz: UIViewController {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var questionsLbl: UILabel!
    @IBOutlet weak var question: UIImageView!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    var pokemon = [Pokemon]()
    var answer = ""
    var points = 0
    var clicked = false
    var questions = 15
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        parsePokemonCSV()
        reset()
    }
    
    func reset(){
        if(questions <= 0){
            performSegue(withIdentifier: "finishedQuiz", sender: nil)
        }
        option1.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 85/255, alpha: 1)
        option2.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 85/255, alpha: 1)
        option3.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 85/255, alpha: 1)
        option4.backgroundColor = UIColor(red: 255/255, green: 88/255, blue: 85/255, alpha: 1)
        let rand = randomInt(0, max: 717)
        question.image = UIImage(named: "\(rand+1)")
        let poke = pokemon[rand]
        answer = poke.name
        let options = randomInt(1, max: 4)
        if(options == 1){
            option1.setTitle(answer, for: UIControlState())
            option2.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option3.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option4.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
        }
        else if(options == 2){
            option2.setTitle(answer, for: UIControlState())
            option1.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option3.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option4.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
        }
        else if(options == 3){
            option3.setTitle(answer, for: UIControlState())
            option2.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option1.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option4.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
        }
        else if(options == 4){
            option4.setTitle(answer, for: UIControlState())
            option2.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option3.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
            option1.setTitle(pokemon[randomInt(0, max: 717)].name, for: UIControlState())
        }
        score.text = "\(points)"
        questionsLbl.text = "\(questions)"
        clicked = false
    }
    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func randomInt(_ min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func checkAnswer(_ choice:Int){
        var correct = 0
        if(option1.titleLabel?.text == answer){
            correct = 1
            option1.backgroundColor = UIColor.green
            option2.backgroundColor = UIColor.red
            option3.backgroundColor = UIColor.red
            option4.backgroundColor = UIColor.red
        }
        else if(option2.titleLabel?.text == answer){
            correct = 2
            option2.backgroundColor = UIColor.green
            option1.backgroundColor = UIColor.red
            option3.backgroundColor = UIColor.red
            option4.backgroundColor = UIColor.red
        }
        else if(option3.titleLabel?.text == answer){
            correct = 3
            option3.backgroundColor = UIColor.green
            option2.backgroundColor = UIColor.red
            option1.backgroundColor = UIColor.red
            option4.backgroundColor = UIColor.red
        }
        else if(option4.titleLabel?.text == answer){
            correct = 4
            option4.backgroundColor = UIColor.green
            option2.backgroundColor = UIColor.red
            option3.backgroundColor = UIColor.red
            option1.backgroundColor = UIColor.red
        }
        
        if(choice==correct){
            points += 1
        }
        
        questions -= 1
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 2)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            self.reset()
        })
    }
    
    @IBAction func option1Pressed(_ sender: AnyObject) {
        if(!clicked){
            checkAnswer(1)
            clicked = true
        }
    }
    @IBAction func option2Pressed(_ sender: AnyObject) {
        if(!clicked){
            checkAnswer(2)
            clicked = true
        }
    }
    @IBAction func option3Pressed(_ sender: AnyObject) {
        if(!clicked){
            checkAnswer(3)
            clicked = true
        }
    }
    @IBAction func option4Pressed(_ sender: AnyObject) {
        if(!clicked){
            checkAnswer(4)
            clicked = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destinationViewController = segue.destination as? QuizHelp{
            destinationViewController.finishedQuiz = true
            destinationViewController.musicPlayer = musicPlayer
        }
    }
    
    
    
    
    
    
    
    
    
}
