//
//  PlayViewController.swift
//  CuoiKi_Tuan
//
//  Created by Huỳnh Thanh Tuấn on 12/14/16.
//  Copyright (c) 2016 Huỳnh Thanh Tuấn. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var thamSoTruyen : NSUserDefaults!
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var LabelName: UILabel!
    @IBOutlet weak var LabelScore: UILabel!
    @IBOutlet weak var LabelWrong: UILabel!
    
    @IBOutlet weak var labelD: UILabel!
    @IBOutlet weak var labelC: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelA: UILabel!
    var stt:NSInteger!
    var stt2:NSInteger!
    var max:NSInteger!
    var min:NSInteger!
    var score = 0
    var wrong = 0
    var mode : NSString!
    var HighScore = 0
    
    let MangAnh:[String]=["Archery","Badminton","Baseball","Basketball","Boxing","Cycling", "Darts","Football", "Golf", "HorseRacing", "Snooker", "TableTennis","Elbow","Eye", "Eyebrow", "Eyslasher", "Finger", "Fist", "Foot","Forehead","Gums", "Hair", "Hand", "Head", "Heel", "IndexFinger", "Iris","Apple","Avocado", "Banana", "Bread", "Cake", "Cheese", "Chicken", "Chocolate", "Cookie", "Corn", "Cucumber", "Egg", "Fruit", "Grapes", "Hamberger", "HotDog", "lemon", "Meat", "Melon", "Onion", "Organge", "Pepper", "Pizza", "Potato", "Rice", "salad", "Salt", "Sandwich", "Soup", "Tomato", "Vegetables","WaterMelon" ]

    @IBAction func btnA(sender: AnyObject) {
         DungSai(labelA.text!)
    }
    
    @IBAction func btnB(sender: AnyObject) {
       DungSai(labelB.text!)
    }
    
    @IBAction func btnC(sender: AnyObject) {
         DungSai(labelC.text!)
    }
    
    @IBAction func btnD(sender: AnyObject) {
         DungSai(labelD.text!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        thamSoTruyen = NSUserDefaults.standardUserDefaults()
        mode = thamSoTruyen.objectForKey("Mode") as NSString
        LabelName.text = thamSoTruyen.objectForKey("Name") as NSString
        if(thamSoTruyen.objectForKey("HighScore") != nil)
        {
            HighScore = thamSoTruyen.objectForKey("HighScore") as NSInteger
        }
        score = 0
        wrong = 0
        stt = 0
        
        //Thiet Lap Mode
        switch mode {
        case "Sport":
            min=0
            max=11
            break;
        case "Body":
            min=12
            max=26
            break;
        case "Food":
            min=27
            max=58
            break;
        default:
            min=0
            max=58
            break;
        }
        stt=min
        //Complete Setup Mode
        
        LoadImageAndLabel()
        
    }
    
    func LoadImageAndLabel()
    {
        Image.image = UIImage(named: MangAnh[stt]+".png")
        var random: UInt32 = arc4random()
        random = random % 4
        if(stt>min+6)
        {
            stt2=stt-6
        }
        else
        {
            stt2=stt
        }
        switch random  {
        case 0:
            labelA.text = MangAnh[stt]
            labelB.text = MangAnh[stt2+1]
            labelC.text = MangAnh[stt2+2]
            labelD.text = MangAnh[stt2+3]
            break;
        case 1:
            labelA.text = MangAnh[stt2+1]
            labelB.text = MangAnh[stt]
            labelC.text = MangAnh[stt2+2]
            labelD.text = MangAnh[stt2+3]
            break;
        case 2:
            labelA.text = MangAnh[stt2+1]
            labelB.text = MangAnh[stt2+2]
            labelC.text = MangAnh[stt]
            labelD.text = MangAnh[stt2+3]
            break;
        default:
            labelA.text = MangAnh[stt2+3]
            labelB.text = MangAnh[stt2+1]
            labelC.text = MangAnh[stt2+2]
            labelD.text = MangAnh[stt]
            break;
        }
    }
    func DungSai(dapan: NSString )
    {
        
        if(dapan==MangAnh[stt])
        {
            score=score+1
        }
        else
        {
            wrong = wrong+1

        }
        LabelScore.text = NSString(format: "Score :%i",score)
        LabelWrong.text = NSString(format: "Wrong :%i",wrong)
        stt=stt+1
        if(stt==max+1)
        {
            if(score>HighScore)
            {
                HighScore = score
                thamSoTruyen.setObject(HighScore, forKey: "HighScore")
                thamSoTruyen.setObject(LabelName.text, forKey: "NameHighScore")
                thamSoTruyen.synchronize()
            }
            thamSoTruyen.setObject(score, forKey: "Score")
            thamSoTruyen.setObject(wrong, forKey: "Wrong")
            thamSoTruyen.synchronize()
            ChuyenManHinh()
        }
        else
        {
            LoadImageAndLabel()
        }
    }
    
    func ChuyenManHinh()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyBoard.instantiateViewControllerWithIdentifier("End") as EndGameViewController
        
        self.presentViewController(resultViewController, animated:true, completion:nil)
    }
    
    //override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) { thuc hien truoc khi chuyen man hinh
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
