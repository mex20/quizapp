//
//  ViewController.swift
//  appQuiz
//
//  Created by Emergency Mexican on 6/13/17.
//  Copyright © 2017 EmergencyMexicoSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["What programming language is used in Linux's internal works?", "What is the main language for programming in iOS?", "What is the loopback ip address?"]
    let answers = [["Python", "Swift", "Objective-C"], ["Swift", "Perl", "Mandarin Chinese"], ["127.0.0.1", "192.168.1.1", "10.0.0.1"]]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    
    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    //Button
    @IBAction func action(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
            points += 1
        }
        else
        {
            print ("WRONG!!!!!")
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else{
            performSegue(withIdentifier:"showScore", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    //Function htat displays new question
    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
      
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        for i in 1...3
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

