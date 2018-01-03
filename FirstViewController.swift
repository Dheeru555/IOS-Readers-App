//
//  FirstViewController.swift
//  ReadersSpeedApp
//
//  Created by Devineni, Sai Dheeraj on 7/18/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit
import Foundation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var appTabBar: UITabBar!
    
    @IBOutlet weak var WordCountText: UILabel!
    
    @IBOutlet weak var displayText: UILabel!
    
    var filemgr:FileManager!
    
    
    var x = 1
    
    var counter = 0
    var temp1 = 0.0
    
    var timeDelay : Int = 2
    
    var timer = Timer()
    var timeInterval = 60
    var firstTime = true
    
    var timerScheduled = false
    
    var unameDict = [String:Int]()
    var speedDict = [String:Array<String>]()
    var triesDict = [String:Int]()
    var topspeedDict = [String:Double]()
    
    var dupunameDict = [String:Int]()
    var dupspeedDict = [String:Array<String>]()
    var duptriesDict = [String:Int]()
    var duptopspeedDict = [String:Double]()
    
    var userArray1 = [String]()
    var showUser : String = ""
    var showSpeed : String = ""
    
    var split = [String]()
    var counterpart = 0
    
    var readCounter = 0
    var timeTracker = 0.0
    
    
    
    
    @IBOutlet weak var UserLabel: UILabel!
    @IBOutlet weak var UserText: UITextField!
    @IBOutlet weak var SpeedLabel: UILabel!
    @IBOutlet weak var SpeedText: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    
  //  NSHomeDirectory() + "/Documents/Usersdata.txt"
//    let path = "/Users/devinenis7463/Documents/Usersdata.txt"
//    let path1 = "/Users/devinenis7463/Documentss/Triesdata.txt"
//    let path2 = "/Users/devinenis7463/Documents/TopSpeeddata.txt"
//    let path3 = "/Users/devinenis7463/Documents/Alldata.txt"
    
    let path =  NSHomeDirectory() + "/Documents/Usersdata.txt"
    let path1 = NSHomeDirectory() + "/Documents/Triesdata.txt"
    let path2 = NSHomeDirectory() + "/Documents/TopSpeeddata.txt"
    let path3 = NSHomeDirectory() + "/Documents/Alldata.txt"

    
    
    var paragraph = "The world is a fascinating place, and its full of weird and interesting facts that you might have never realized were true. Luckily, the folks over at Reddit have a collection of true facts about life, and we've combed through them to find our favorites.From a creature that can survive the harsh vacuum of space to the odd state sport of Maryland, you're bound to learn something that makes you think twice."
    
    
    
    func updateCounter()
    {
       
        
//        let random = split[Int(arc4random_uniform(UInt32(split.count)))]
//        //print(random)
//        counter = random.characters.count
        //print(counter)
        
       var  random = split[counterpart]
        counterpart += 1
        
        if counterpart == split.count
        {
            counterpart = 0
        }
        
        counter = random.characters.count
        
        readCounter += 1
        timeTracker += Double(60)/Double(SpeedText.text!)!
        
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: random, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
        
        
        if counter%2 == 0
        {
            temp1=Double(counter)/Double(2)
            //print(temp1)
            myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: NSRange(location:Int(temp1)-1,length:2))
            wordLabel.attributedText = myMutableString
        }
        else{
            temp1=Double(counter)/Double(2)
            
            temp1.round()
            //print(temp1)
            
            myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue, range: NSRange(location:Int(temp1)-1,length:1))
            wordLabel.attributedText = myMutableString
        }
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        
        timer.invalidate()
        wordLabel.text = ""
        SpeedText.text = "0"
        UserText.text=""
        displayText.text=""
        timerScheduled = false
        
        WordCountText.isHidden = true
        
        readCounter = 0
        timeTracker = 0
        
    }
    @IBAction func playAction(_ sender: UIBarButtonItem) {
        
        if let pk1 = Double(UserText.text!) as? Double
        {
            print("In user selector \(pk1)")
            let alert = UIAlertController(title: "Bad values entered ", message: "Please check if username is in string format only", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
      if let chk = String(UserText.text!) as? String, let chk1 = Double(SpeedText.text!) as? Double
      {
        print("In nexttt userr selector" + chk)
        print("Time Delay---------------------->\(timeDelay)")
        
        if( !timerScheduled )
        {
            timerScheduled = true
            
            
                sleep(UInt32(timeDelay))
            
        displayText.isHidden = false
        wordLabel.isHidden = false
        WordCountText.isHidden = true
            
        split = paragraph.components(separatedBy: " ")
        
        timer = Timer.scheduledTimer(timeInterval: Double(60)/Double(SpeedText.text!)!, target: self, selector: #selector(FirstViewController.updateCounter), userInfo: nil, repeats: true)
        
        RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
        timer.fire()

        
        if(x == 1 && unameDict[UserText.text!] == nil)
        {
            unameDict[UserText.text!] = 0
            x = 2
            displayText.text = UserText.text! + "---- > Thanks for joining"
            
        }
        else
        {
            for k in unameDict.keys
            {
                if k != UserText.text! && unameDict[UserText.text!] == nil
                {
                    unameDict[UserText.text!] = 0
                    print("new user: \(UserText.text!)")
                    displayText.text = UserText.text! + "---- > Thanks for joining"
                    
                    break
                }
                else
                {
                   displayText.text = UserText.text! + "---- > Already signed in"
                    print("Already signed in ")
                }
            }
        }
        
       //print(unameDict)
            
            if speedDict[UserText.text!] == nil || topspeedDict[UserText.text!] == nil || triesDict[UserText.text!] == nil
            {
                speedDict[UserText.text!] = [SpeedText.text!]
                triesDict[UserText.text!] = 1
                topspeedDict[UserText.text!] = 0.0
            }
            else{
                speedDict[UserText.text!]! += [SpeedText.text!]
                triesDict.updateValue(triesDict[UserText.text!]!+1,forKey: UserText.text!)
            }
            
            if Double(SpeedText.text!)! > topspeedDict[UserText.text!]!
            {
                topspeedDict[UserText.text!] = Double(SpeedText.text!)
            }
            
            

            
         print("speed" + "\(speedDict)")
        print("number of tries" + "\(triesDict)")
        print("top speed" + "\(topspeedDict)")
            
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).speedDict1 = speedDict
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).triesDict1 = triesDict
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).topspeedDict1 = topspeedDict
            
         (self.tabBarController?.viewControllers?[1] as! SecondViewController).currentUser = UserText.text!
            
          
          
            userArray1 = []
            for k in unameDict.keys
            {
                userArray1 += [k]
            }
            
            
            (self.tabBarController?.viewControllers?[2] as! ThirdViewController).userArray = userArray1
            
            print("In first controller"+"\(unameDict)")
            writeUnameFunc()
            writeTriesFunc()
            writeTopSpeedFunc()
            writeSpeedFunc()
            
    }
        }
        else
      {
        let alert = UIAlertController(title: "Bad values entered ", message: "Please check if username is in string format and speed should be in double only", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

      }
        }
    }

    @IBAction func pause(_ sender: UIBarButtonItem) {
        
        
        timer.invalidate()
        timerScheduled = false
        WordCountText.isHidden = false
        WordCountText.text! = "No of words read: " + String(readCounter) + " Time ->" + String(format : "%.1f",timeTracker) + "sec"
        readCounter = 0
        timeTracker = 0

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
       
        if showSpeed.isEmpty
        {
            SpeedText.text = SpeedText.text!
        }
        else
        {
            SpeedText.text = showSpeed
        }
        
        if showUser.isEmpty
        {
            UserText.text = UserText.text!
            displayText.text=""
            
        }
        else
        {
            UserText.text = showUser
            displayText.text = showUser + " -------> Already signed in"
        }
        wordLabel.isHidden = true
//        readUnameFunc()
//        readTriesFunc()
//        readTopSpeedFunc()
//        readAllSpeedFunc()
//        
//        var strAr : String = ""
//        for k in unameDict.keys
//        {
//            strAr=k
//        }
//        
//        userArray1 = []
//        for p in unameDict.keys
//        {
//            userArray1 += [p]
//        }
//        
//        (self.tabBarController?.viewControllers?[1] as! SecondViewController).speedDict1 = speedDict
//        (self.tabBarController?.viewControllers?[1] as! SecondViewController).triesDict1 = triesDict
//        (self.tabBarController?.viewControllers?[1] as! SecondViewController).topspeedDict1 = topspeedDict
//        (self.tabBarController?.viewControllers?[1] as! SecondViewController).currentUser = strAr
//        
//        (self.tabBarController?.viewControllers?[2] as! ThirdViewController).userArray = userArray1
       
    }
    
    override func viewDidLoad() {
        filemgr = FileManager.default
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WordCountText.isHidden = true
        wordLabel.isHidden = true
        
        
        readUnameFunc()
        readTriesFunc()
        readTopSpeedFunc()
        readAllSpeedFunc()
        
        
        
        
        
        if unameDict.isEmpty || speedDict.isEmpty || triesDict.isEmpty || topspeedDict.isEmpty
        {
            print("Dont show statistics")
        }
        else
        {
            var strAr : String = ""
            for k in unameDict.keys
            {
                strAr=k
            }

            
        userArray1 = []
        for p in unameDict.keys
        {
            userArray1 += [p]
        }
        
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).speedDict1 = speedDict
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).triesDict1 = triesDict
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).topspeedDict1 = topspeedDict
        (self.tabBarController?.viewControllers?[1] as! SecondViewController).currentUser = strAr
        
        (self.tabBarController?.viewControllers?[2] as! ThirdViewController).userArray = userArray1
        }
    }

    func writeUnameFunc()
    {
        var counter = 0
        print("reached")
        if !filemgr.fileExists(atPath: path) {
            var StringArr : String = ""
            for(name,val) in unameDict
            {
                counter += 1
                if counter == unameDict.count
                {
                StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("User File Exists")
                try StringArr.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the user file")
            }
        }
        else{
            var StringArr : String = ""
            for(name,val) in unameDict
            {
                counter += 1
                if counter == unameDict.count
                {
                    StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("User File Exists")
                try StringArr.write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the user file")
            }

            
                    }
        
    
    }
    
    
    
    func writeTriesFunc()
    {
        var counter = 0
        print("tries reached")
        if !filemgr.fileExists(atPath: path1) {
            var StringArr : String = ""
            for(name,val) in triesDict
            {
                counter += 1
                if counter == triesDict.count
                {
                    StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("Tries File Exists")
                try StringArr.write(toFile: path1, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the tries file")
            }
        }
        else{
            var StringArr : String = ""
            for(name,val) in triesDict
            {
                counter += 1
                if counter == triesDict.count
                {
                    StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("Tries File Exists")
                try StringArr.write(toFile: path1, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the tries file")
            }

        }
        
        
    }
    
    func writeTopSpeedFunc()
    {
        var counter = 0
        print("topspeed reached")
        if !filemgr.fileExists(atPath: path2) {
            var StringArr : String = ""
            for(name,val) in topspeedDict
            {
                counter += 1
                if counter == topspeedDict.count
                {
                    StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("top speed File Exists")
                try StringArr.write(toFile: path2, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the top speed file")
            }
        }
        else{
            var StringArr : String = ""
            for(name,val) in topspeedDict
            {
                counter += 1
                if counter == topspeedDict.count
                {
                    StringArr += "\(name) \(val)"
                }
                else
                {
                    StringArr += "\(name) \(val)\n"
                }
                
            }
            
            do {
                print("top speed File Exists")
                try StringArr.write(toFile: path2, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the top speed file")
            }

        }
        
        
    }
    
    
    func writeSpeedFunc()
    {
        var counter = 0
        
        print("All speed reached")
        if !filemgr.fileExists(atPath: path3) {
            var StringArr : String = ""
            for(name,val) in speedDict
            {
                counter += 1
                StringArr += "\(name) "
                var counter2 = 0
                for v in val
                {
                    counter2 += 1
                    if counter2 == val.count
                    {
                        StringArr += "\(v)"
                    }
                    else
                    {
                        StringArr += "\(v) "
                    }
                    
                }
                if counter == speedDict.count
                {
                    
                }
                else
                {
                    StringArr += "\n"
                }
                
            }
            
            do {
                print("All speed File Exists")
                try StringArr.write(toFile: path3, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the all speed file")
            }
        }
        else{
            var StringArr : String = ""
            for(name,val) in speedDict
            {
                counter += 1
                StringArr += "\(name) "
                var counter2 = 0
                for v in val
                {
                    counter2 += 1
                    if counter2 == val.count
                    {
                        StringArr += "\(v)"
                    }
                    else
                    {
                        StringArr += "\(v) "
                    }
                    
                }
                if counter == speedDict.count
                {
                    
                }
                else
                {
                    StringArr += "\n"
                }
                
            }
            
            do {
                print("All speed File Exists")
                try StringArr.write(toFile: path3, atomically: false, encoding: String.Encoding.utf8)
            } catch _ {
                print("Error writing to the all speed file")
            }

        }
        
        
    }

    
    
    
    
    
    func readUnameFunc()
    {
        print("view did load reached")
        
        
        
        if filemgr.fileExists(atPath: path) {
            
            let fileSize = (try! FileManager.default.attributesOfItem(atPath: path)[FileAttributeKey.size] as! NSNumber).uint64Value
            
            print("file size----> \(fileSize)")
            
            if fileSize != 0
            {
            if let text = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
            {
                var AA = text.components(separatedBy: "\n")
                if AA.isEmpty
                {
                    print("do nothing")
                }
              else
                {
                for x in AA
                {
                    var BB = x.components(separatedBy: " ")
                    //print(BB)
                    dupunameDict[BB[0]] = Int(BB[1])
                    
                }
                
               print("read user data" + "\(dupunameDict)")
                
                unameDict = dupunameDict
            }
        }
            else {
                print("Error Reading users file")
            }
            
        }
            else
            {
                unameDict = [:]
            }
        }
        else{
            print("error opening users file for read")
        }
    }
    
    func readTriesFunc()
    {
        print("view did load tries reached")
        
        
        
        if filemgr.fileExists(atPath: path1) {
            let fileSize1 = (try! FileManager.default.attributesOfItem(atPath: path1)[FileAttributeKey.size] as! NSNumber).uint64Value
            if fileSize1 != 0
            {
            if let text = try? String(contentsOfFile: path1, encoding: String.Encoding.utf8){
                var AA = text.components(separatedBy: "\n")
                //print(AA)
                for x in AA
                {
                    var BB = x.components(separatedBy: " ")
                    //print(BB)
                    duptriesDict[BB[0]] = Int(BB[1])
                    
                }
                
                 print("read tries data" + "\(duptriesDict)")
                
                triesDict = duptriesDict
            }else {
                print("Error tries Reading file")
            }
            
        }
            else
            {
                triesDict = [:]
            }
        }    else{
            print("error opening tries file for read")
        }
    }

    
    func readTopSpeedFunc()
    {
        print("view did load top spedd reached")
        
        
        
        if filemgr.fileExists(atPath: path2) {
            let fileSize2 = (try! FileManager.default.attributesOfItem(atPath: path2)[FileAttributeKey.size] as! NSNumber).uint64Value
            if fileSize2 != 0
            {
            if let text = try? String(contentsOfFile: path2, encoding: String.Encoding.utf8){
                var AA = text.components(separatedBy: "\n")
                //print(AA)
                for x in AA
                {
                    var BB = x.components(separatedBy: " ")
                    //print(BB)
                    duptopspeedDict[BB[0]] = Double(BB[1])
                    
                }
                
                print("read top speed data" + "\(duptopspeedDict)")
                topspeedDict = duptopspeedDict
            }else {
                print("Error top speed Reading file")
            }
            
        }
            else
            {
                topspeedDict = [:]
            }
        }
        else{
            print("error opening top speed file for read")
        }
    }
    
    func readAllSpeedFunc()
    {
        
        
        print("view did load All spedd reached")
        if filemgr.fileExists(atPath: path3) {
            let fileSize3 = (try! FileManager.default.attributesOfItem(atPath: path3)[FileAttributeKey.size] as! NSNumber).uint64Value
            if fileSize3 != 0
            {
            if let text = try? String(contentsOfFile: path3, encoding: String.Encoding.utf8){
                var AA = text.components(separatedBy: "\n")
                
                for x in AA
                {
                    var BB = x.components(separatedBy: " ")
                    var counter3 = 0
                    
                    for BBB in BB
                    {
                        counter3 += 1
                        if dupspeedDict[BB[0]] == nil
                        {
                            dupspeedDict[BB[0]] = [BB[1]]
                        }
                        else if counter3 == 2{
                            print("Do nothing")
                        }
                        else
                        {
                            dupspeedDict[BB[0]]?.append(BBB)
                        }
                    }
                    
                    
                    
                }
                
                print("read all speed data" + "\(dupspeedDict)")
                speedDict = dupspeedDict
            }else {
                print("Error all speed Reading file")
            }
            
        }
            else
            {
                speedDict = [:]
            }
        }else{
            print("error opening all speed file for read")
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

