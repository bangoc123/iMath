//
//  ViewController.swift
//  Math
//
//  Created by Ngoc on 8/15/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_correctNumber: UILabel!
   
    @IBOutlet weak var lbl_incorrectNumber: UILabel!
    
    @IBOutlet weak var lbl_operation: UILabel!
    
    @IBOutlet weak var lbl_countdown: UILabel!
    
    @IBOutlet weak var lbl_number1: UILabel!
    
    @IBOutlet weak var lbl_number2: UILabel!
    
    @IBOutlet weak var btn_bt1: UIButton!
    
    @IBOutlet weak var btn_bt2: UIButton!
    
    @IBOutlet weak var btn_bt3: UIButton!
    
    var sum = 0
    
    var correctAnswer = 0
    
    var incorrectAnswer = 0
    
    var count = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setRandom()
        
        
         _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
        
    }
    
    
    func update() {
        if(count > 0) {
            count -= 1
            lbl_countdown.text = String(count)
            
        }
        
        if (count == 0){
            setRandom()
            count = 20
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_action(sender: UIButton) {
        
        count = 20
        
        if Int(sender.titleLabel!.text!)! == sum  {
            correctAnswer += 1
            
            lbl_correctNumber.text = String(correctAnswer)
            
            setRandom()
        } else{
            incorrectAnswer += 1
            
            lbl_incorrectNumber.text = String(incorrectAnswer)
            
            setRandom()
        
        }
        
        
        print(sender.titleLabel!.text!)
        
        print(String(sum))
    }
    
    func setRandom(){
        
        let random1 = Int(arc4random_uniform(20))
        
        let random2 = Int(arc4random_uniform(20) + 1)
        
        lbl_number1.text = String(random1)
        
        lbl_number2.text = String(random2)
        
        setResult(random1, randomB: random2)
        
    }
    
    func setResult(randomA: Int, randomB: Int){
        var random3, random4: Int
        
        var btnArray = [btn_bt1, btn_bt2, btn_bt3]
        
        let indexResultButton = Int(arc4random_uniform(3))
        
        sum = sum(randomA, p2: randomB)
        
        btnArray[indexResultButton].setTitle(String(sum), forState: .Normal)
        
        btnArray.removeAtIndex(indexResultButton)
        
        btnArray.reverse()


        random3 = Int(arc4random_uniform(30))
        
        random4 = Int(arc4random_uniform(30) + 1)

        
        btnArray[0].setTitle(String(random3), forState: .Normal)
        
        btnArray[1].setTitle(String(random4), forState: .Normal)
        
    }
    
    
    func sum(p1: Int, p2: Int) -> Int{
        
        let openrationChoice = Int(arc4random_uniform(2))
        
        var result = 0
        
        if(openrationChoice == 0){
            lbl_operation.text = "+"
            result = p1 + p2
        }else{
            lbl_operation.text = "-"
            result = p1 - p2
        }
        
        return result
    }
}

