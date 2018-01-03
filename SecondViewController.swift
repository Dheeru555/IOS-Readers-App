//
//  SecondViewController.swift
//  ReadersSpeedApp
//
//  Created by Devineni, Sai Dheeraj on 7/18/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var speed1Text: UITextField!
    @IBOutlet weak var speed2Text: UITextField!
    @IBOutlet weak var speed3Text: UITextField!
    @IBOutlet weak var triesText: UITextField!
    @IBOutlet weak var topUsers: UITextView!
    
    @IBOutlet weak var User: UILabel!
    
    var currentUser = String()
    
    var speedArray = Array<String>()
    
    var x = 1
    
    var speedDict1 = [String:Array<String>]()
    var triesDict1 = [String:Int]()
    var topspeedDict1 = [String:Double]()
    
 

    
    func doStatFunc()
    {
    
        topUsers.text=""
        speed1Text.text=""
        speed2Text.text=""
        speed3Text.text=""
        
       var cnt = 0
        
        for (name,speeds) in (Array(topspeedDict1).sorted {$0.1 > $1.1})
        {
           cnt += 1
            topUsers.text! += "\(cnt)" + ")" + "\(name) -----> \(speeds) \n"
        }
        
        print(currentUser)
        print(triesDict1[currentUser])
        triesText.text = String(describing: triesDict1[currentUser]!)
        User.text! = currentUser
        
        
        for(name1,speeds1) in speedDict1
        {
            if currentUser == name1
            {
                speedArray = speeds1
                
            }
            
        }
        
        for spl in speedArray.reversed()
        {
            if(x == 1)
            {
                speed1Text.text! = spl
                x=2
            }
            else if(x == 2)
            {
                speed2Text.text! = spl
                x=3
            }
            else if(x == 3)
            {
                speed3Text.text! = spl
                x=4
            }
        }
        
        
        
        x=1

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        
        if speedDict1.isEmpty || triesDict1.isEmpty || topspeedDict1.isEmpty || currentUser.isEmpty
        {
            print("Dont show statistics")
        }
        else
        {
            doStatFunc()
        }


    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        triesText.text = ""
        speed1Text.text = ""
        speed2Text.text = ""
        speed3Text.text = ""
        x=1
        
        if speedDict1.isEmpty || triesDict1.isEmpty || topspeedDict1.isEmpty || currentUser.isEmpty
        {
            print("Dont show statistics")
        }
        else
        {
            doStatFunc()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

