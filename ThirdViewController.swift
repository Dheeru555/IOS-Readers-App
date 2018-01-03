//
//  ThirdViewController.swift
//  ReadersSpeedApp
//
//  Created by Devineni, Sai Dheeraj on 7/20/17.
//  Copyright © 2017 Devineni, Sai Dheeraj. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    
    
    @IBOutlet weak var showTable: UITableView!
    @IBOutlet weak var wpmLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    @IBOutlet weak var wpmText: UITextField!
    @IBOutlet weak var delayText: UITextField!
    
    @IBOutlet weak var Segment: UISegmentedControl!
    
    @IBOutlet weak var SegmentLabel: UISegmentedControl!
    
    @IBOutlet weak var Done: UIButton!
    
    var userArray = [String]()

    
    @IBAction func doAction(_ sender: UIButton) {
        
        if SegmentLabel.selectedSegmentIndex == 0
        {
            wpmLabel.isHidden = false
            wpmText.isHidden = false
            Done.isHidden = false
            
            delayLabel.isHidden = true
            delayText.isHidden = true
            showTable.isHidden = true
            
            if let chk1 = Double(wpmText.text!) as? Double
            {
                (self.tabBarController?.viewControllers?[0] as! FirstViewController).showSpeed = wpmText.text!
                
                print("In view appear")
                
            }
            else
            {
                
                let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is in double or not", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if SegmentLabel.selectedSegmentIndex == 2
        {
           
            delayLabel.isHidden = false
            delayText.isHidden = false
            Done.isHidden = false
            
            wpmLabel.isHidden = true
            wpmText.isHidden = true
            
            showTable.isHidden = true
            
            if let chk2 = UInt32(delayText.text!) as? UInt32
            {
                (self.tabBarController?.viewControllers?[0] as! FirstViewController).timeDelay = Int(delayText.text!)!
                
                print("In normal selected index")
                
            }
            else
            {
                
                let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is unsigned integer or not", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
        }

        
    }
  
    
    
    @IBAction func SegmentAction(_ sender: UISegmentedControl) {
        
        
        if sender.selectedSegmentIndex == 0
        {
            wpmLabel.isHidden = false
            wpmText.isHidden = false
            
            Done.isHidden = false
            
            delayLabel.isHidden = true
            delayText.isHidden = true
            
            showTable.isHidden = true
            
           
            if let chk1 = Double(wpmText.text!) as? Double
            {
                (self.tabBarController?.viewControllers?[0] as! FirstViewController).showSpeed = wpmText.text!
                
                print("In normal selected index")

            }
            else
            {
            
            let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is in double or not", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            }
            
        }
            
        else if sender.selectedSegmentIndex == 1
        {
            wpmLabel.isHidden = true
            wpmText.isHidden = true
            
            delayLabel.isHidden = true
            delayText.isHidden = true
            
            Done.isHidden = true
            
            showTable.isHidden = false
            
            
        }
        else
        {
            delayLabel.isHidden = false
            delayText.isHidden = false
            Done.isHidden = false
            
            wpmLabel.isHidden = true
            wpmText.isHidden = true
            
            showTable.isHidden = true
            
            if let chk2 = UInt32(delayText.text!) as? UInt32
            {
                (self.tabBarController?.viewControllers?[0] as! FirstViewController).timeDelay = Int(delayText.text!)!
                
                print("In normal selected index")
                
            }
            else
            {
                
                let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is unsigned integer or not", preferredStyle: UIAlertControllerStyle.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
            
            
            
            

        }
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
        
        print("Array count" + "\(userArray.count)")
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Users"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactIdentifier = "User"
        let cell = tableView.dequeueReusableCell(withIdentifier: contactIdentifier, for: indexPath)
        var x = userArray[(indexPath.row)]
        print("here in third controller" + "\(x)")
        
        cell.textLabel!.text = x
        
        return cell
        
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       var x = userArray[(indexPath.row)]
       
    (self.tabBarController?.viewControllers?[1] as! SecondViewController).currentUser = x
        
     (self.tabBarController?.viewControllers?[0] as! FirstViewController).showUser = x
        
        

    }
    
   
    //If the transaction count is not zero then it diplays the date of each transaction happend else it will show No transactions to display
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        delayText.isHidden = true
        delayLabel.isHidden = true
        showTable.isHidden = true
        
        wpmText.text="60"
        delayText.text="1"
        
    if SegmentLabel.selectedSegmentIndex == 0
    {
        wpmLabel.isHidden = false
        wpmText.isHidden = false
        Done.isHidden = false
        
        delayLabel.isHidden = true
        delayText.isHidden = true
        showTable.isHidden = true
        
//        if let chk1 = Double(wpmText.text!) as? Double
//        {
//            (self.tabBarController?.viewControllers?[0] as! FirstViewController).showSpeed = wpmText.text!
//            
//            print("In view appear")
//            
//        }
//        else
//        {
//            
//            let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is in double or not", preferredStyle: UIAlertControllerStyle.alert)
//            
//            // add an action (button)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            
//            // show the alert
//            self.present(alert, animated: true, completion: nil)
//        }
    }
    else if SegmentLabel.selectedSegmentIndex == 1
    {
        wpmLabel.isHidden = true
        wpmText.isHidden = true
        
        delayLabel.isHidden = true
        delayText.isHidden = true
        
        Done.isHidden = true
        
        showTable.isHidden = false
        }
        else
    {
        delayLabel.isHidden = false
        delayText.isHidden = false
        
        Done.isHidden = false
        
        wpmLabel.isHidden = true
        wpmText.isHidden = true
        
        showTable.isHidden = true
        
//        if let chk2 = UInt32(delayText.text!) as? UInt32
//        {
//            (self.tabBarController?.viewControllers?[0] as! FirstViewController).timeDelay = Int(delayText.text!)!
//            
//            print("In normal selected index")
//            
//        }
//        else
//        {
//            
//            let alert = UIAlertController(title: "Bad value entered ", message: "Please check if given value is unsigned integer or not", preferredStyle: UIAlertControllerStyle.alert)
//            
//            // add an action (button)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            
//            // show the alert
//            self.present(alert, animated: true, completion: nil)
//        }
        


        }

      
        showTable.reloadData()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       showTable.delegate = self
        showTable.dataSource = self
        
        delayText.isHidden = true
        delayLabel.isHidden = true
        showTable.isHidden = true
        
        wpmText.text="60"
        delayText.text="1"
        
       // userArray=[]
       
//         print("In third controller"+"\(unameDict2)")
//        for k in unameDict2.keys
//        {
//            userArray += [k]
//        }
//        
//        print(userArray)
        //self.showTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
